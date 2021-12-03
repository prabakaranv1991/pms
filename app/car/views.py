from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from car.models import Car, CarOdometer
from datetime import date, datetime, timedelta
import pandas as pd
from django.db import connection

@login_required
def car_status(request, dashboard=False):
    CarOdometer.collect_status()
    duration = int(request.GET.get('duration', 0))
    cursor = connection.cursor()
    query = """SELECT 
                    c.name, to_char(a.date, 'MM-YYYY'),
                    COUNT(1), SUM(a.kms), ROUND(AVG(a.kms))
                FROM 
                    fact_car_odometer AS a 
                    JOIN dim_car_detail AS c
                        ON c.id=a.car_id
                WHERE a.kms > 0
                GROUP BY c.name, to_char(a.date, 'MM-YYYY')
                ORDER BY to_char(a.date, 'MM-YYYY') DESC"""
    cursor.execute(query)
    car_summary = {}
    for row in cursor.fetchall():
        if row[0] not in car_summary:
            car_summary[row[0]] = []
        car_summary[row[0]].append(row)
    cars = Car.objects.all().order_by('name')

    #Summary(Current Month & Date)
    car_history = CarOdometer.objects.filter(date__year=date.today().year, date__month=date.today().month).order_by('date').values('car__name', 'date', 'kms')
    car_history = pd.DataFrame.from_records(car_history)
    car_history['month'] = car_history['date'].apply(lambda data: data.strftime("%Y-%m"))
    car_history['date'] = car_history['date'].apply(lambda data: data.strftime("%Y-%m-%d"))
    current_month_kms = car_history.loc[car_history['month'] == datetime.now().strftime("%Y-%m")].groupby('car__name').sum('kms').to_dict()
    today_kms = car_history.loc[car_history['date'] == datetime.now().strftime("%Y-%m-%d")].groupby('car__name').sum('kms').to_dict()

    if duration > 0:
        filter = {'date__gt': datetime.today() - timedelta(days = int(duration))}
    else:
        if duration == -1:
            last_date = date.today().replace(day = 1) - timedelta(days = 1)
            filter = {'date__gte': date.today().replace(day = 1) - timedelta(days = last_date.day), 'date__lte': last_date}
        else:
            filter = {'date__year': date.today().year, 'date__month': date.today().month}
    car_history = CarOdometer.objects.filter(**filter).order_by('date').values('car__name', 'date', 'kms')
    car_history = pd.DataFrame.from_records(car_history)
    car_history['month'] = car_history['date'].apply(lambda data: data.strftime("%Y-%m"))
    car_history['date'] = car_history['date'].apply(lambda data: data.strftime("%Y-%m-%d"))
    summary = {
        'month_summary': car_summary,
        'month': current_month_kms,
        'today': today_kms
    }
    graph_data = {'header': [], 'values': {}}
    for index, data in car_history.iterrows():
        graph_data['header'].append(data['date'])
        if data['car__name'] not in graph_data['values']:
            graph_data['values'][data['car__name']] = []
        graph_data['values'][data['car__name']].append(int(data['kms']))
    data = {'cars': cars, 'summary': summary, 'duration': duration, 'graph_data': graph_data, 'dashboard': dashboard}
    if dashboard:
        return data
    return render(request, "car_status.html", data)