from doctest import debug_script
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

class Call(TimeStampedModel):
    number = models.CharField(max_length=50)
    person_name = models.CharField(max_length=50)
    type = models.CharField(max_length=100, choices=[('loan', 'LOAN'), ('insurance', 'INSURANCE'), ('trust', 'TRUST')], default='loan')
    bank = models.CharField(max_length=100, choices=[('icici', 'ICICI'), ('hdfc', 'HDFC'), ('sbi', 'SBI'), ('kvb', "KVB"), ('indian_bank', 'INDIAN BANK'), ('other', 'OTHERS'), ('bajaj', 'BAJAJ')])
    short_description = models.CharField(max_length=100)
    response = models.CharField(max_length=50)
    description = models.TextField(null=True, blank=True)    

    class Meta:
        db_table = 'dim_call'
    
    def get_absolute_url(self):
        return '/other/call/'

