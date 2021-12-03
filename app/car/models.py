from django.db import models
from abstract_models import TimeStampedModel
from django.conf import settings
import requests, json
from datetime import datetime, date
import time

class Car(TimeStampedModel):

    name = models.CharField(max_length = 50)
    year = models.IntegerField()
    purchased_kms = models.IntegerField()
    insurance_date = models.DateField()
    total_kms = models.DecimalField(max_digits = 15, decimal_places = 2)
    gps_id = models.IntegerField(null = True, default = None)
    address = models.TextField(null = True)
    ignition_status = models.BooleanField(default = 0)
    gps_last_updated = models.DateTimeField(null = True)

    class Meta:
        db_table = "dim_car_detail"

class CarOdometer(TimeStampedModel):

    car = models.ForeignKey('Car', on_delete = models.CASCADE, null = True)
    date = models.DateField()
    kms = models.DecimalField(max_digits = 15, decimal_places = 2)

    class Meta:
        db_table = "fact_car_odometer"
        unique_together = ['date', 'car']

    @staticmethod
    def collect_status(from_date=None, to_date=None):
        if from_date == None:
            from_date = str(CarOdometer.objects.aggregate(models.Max('date'))['date__max'])
            to_date = str(date.today())
        print('Colleting Car Data {} TO {}'.format(from_date, to_date))
        url = (settings.GPS_API + "user/login?username={}&password={}").format(settings.GPS_CREDENTIALS['username'], settings.GPS_CREDENTIALS['password'])
        headers = {'Cookie': 'BCSI-CS-90649b75d166525c=1'}
        response = requests.request("POST", url, headers=headers, verify=False)
        data = json.loads(response.text.encode('utf8'))
        access_token = data['data']['access_token']
        cars = Car.objects.filter(gps_id__gt=0)
        for car in cars:
            url = settings.GPS_API + "api/getLiveData?entityId={}&state=1630922439"
            headers['Authorization'] = 'Bearer ' + access_token
            response = requests.request("POST", url.format(car.gps_id), headers=headers, verify=False)
            device_details = json.loads(response.text.encode('utf8'))
            data = device_details['data']['mydevices'][0]
            car.address = data['address']
            car.ignition_status = data['ignition']
            car.total_kms = car.purchased_kms + int(data['intouchOdometer'])
            car.gps_last_updated = datetime.now()
            car.save()
            try:
                CarOdometer.objects.update_or_create(car=car, date=datetime.now(), defaults={'kms': int(float(data['todayKms']))})
            except:
                pass
            if from_date:
                url = settings.GPS_API + "api/report/getDailySummary?isIgnition=0&entityIds={}&startTime={}&endTime={}"
                headers['Authorization'] = 'Bearer ' + access_token
                from_date = int(time.mktime(datetime.strptime(from_date, "%Y-%m-%d").timetuple()))
                to_date = int(time.mktime(datetime.strptime(to_date, "%Y-%m-%d").timetuple()))
                response = requests.request("POST",
                                            url.format(car.gps_id, from_date, to_date),
                                            headers=headers, verify=False)
                device_details = json.loads(response.text.encode('utf8'))
                for data in device_details['data'][0]['innerData']:
                    try:
                        CarOdometer.objects.update_or_create(car=car, date=datetime.fromtimestamp(
                            data['startTimestamp']).strftime("%Y-%m-%d"),
                                                             defaults={'kms': int(float(data['distance']))})
                    except:
                        pass;
