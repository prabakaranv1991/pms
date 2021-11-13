from django.core.management.base import BaseCommand
import requests
import json
from django.conf import settings
from datetime import datetime
import time
from app.car.models import CarOdometer, Car


class Command(BaseCommand):

    def add_arguments(self, parser):
        parser.add_argument('-from')
        parser.add_argument('-to')

    def handle(self, *args, **kwargs):
        url = settings.GPS_API+"user/login?username=9944193082&password=275b37fcf68e182c155f22ded6b5a987"
        headers = {'Cookie': 'BCSI-CS-90649b75d166525c=1'}
        response = requests.request("POST", url, headers = headers, verify = False)
        data = json.loads(response.text.encode('utf8'))
        access_token = data['data']['access_token']
        cars = Car.objects.filter(gps_id__gt = 0)
        for car in cars:
            url = settings.GPS_API+"api/getLiveData?entityId={}&state=1630922439"
            headers['Authorization'] = 'Bearer ' + access_token
            response = requests.request("POST", url.format(car.gps_id), headers = headers, verify = False)
            device_details = json.loads(response.text.encode('utf8'))
            data = device_details['data']['mydevices'][0]
            car.address = data['address']
            car.ignition_status = data['ignition']
            car.total_kms = car.purchased_kms + int(data['intouchOdometer'])
            car.gps_last_updated = datetime.now()
            car.save()
            try:
                CarOdometer.objects.update_or_create(car = car, date = datetime.now(), defaults = {'kms': int(float(data['todayKms']))})
            except:
                pass
            if kwargs['from']:
                from_date = int(time.mktime(datetime.strptime(kwargs['from'], "%Y-%m-%d").timetuple()))
                to_date = int(time.mktime(datetime.strptime(kwargs['to'], "%Y-%m-%d").timetuple()))
                url = settings.GPS_API + "api/report/getDailySummary?isIgnition=0&entityIds={}&startTime={}&endTime={}"
                headers['Authorization'] = 'Bearer ' + access_token
                response = requests.request("POST", url.format(car.gps_id, from_date, to_date), headers = headers, verify = False)
                device_details = json.loads(response.text.encode('utf8'))
                for data in device_details['data'][0]['innerData']:
                    try:
                        CarOdometer.objects.update_or_create(car = car, date = datetime.fromtimestamp(data['startTimestamp']).strftime("%Y-%m-%d"),
                                                             defaults = {'kms': int(float(data['distance']))})
                    except:
                        pass


