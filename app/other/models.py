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

class Card(TimeStampedModel):
    name = models.CharField(max_length=100)
    type = models.CharField(max_length=50, choices=[('credit', 'Credit'), ('debit', 'Debit')])
    bank = models.CharField(max_length=100, choices=[('icici', 'ICICI'), ('hdfc', 'HDFC'), ('sbi', 'SBI'), 
    ('kvb', "KVB"), ('indian_bank', 'INDIAN BANK')])

    class Meta:
        db_table='dim_card'

    def get_absolute_url(self):
        return '/other/card/'

