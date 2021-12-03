from django.db import models
from abstract_models import TimeStampedModel

class Password(TimeStampedModel):
    name = models.CharField(max_length=250)
    url = models.URLField(null=True, blank=True)
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    description = models.TextField(null=True, blank=True)

    class Meta:
        db_table='dim_password'

    def get_absolute_url(self):
        return '/other/password/'
