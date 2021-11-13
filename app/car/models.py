from django.db import models
from app.abstract_models import TimeStampedModel

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
