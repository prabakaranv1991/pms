from datetime import date, datetime
from django.db import models
import pandas as pd
from app.abstract_models import TimeStampedModel
from django.contrib.postgres.fields import JSONField

class Chit(TimeStampedModel):

    name = models.CharField(max_length = 25)
    start_date = models.DateField()
    end_date = models.DateField()
    settlement_date = models.IntegerField(default = 5)
    total_value = models.IntegerField()
    total_months = models.IntegerField()
    interest_percentage = models.DecimalField(max_digits = 15, decimal_places = 2, default = 1.5)
    commission_percentage = models.DecimalField(max_digits = 15, decimal_places = 2, default = 1.5)

    def __str__(self):
        return self.name

    @property
    def is_started(self):
        return date.today() >= self.start_date and len(ChitCustomers.objects.filter(chit=self)) == self.total_months

    @property
    def commission_amount(self):
        return (self.total_value / 100) * float(self.commission_percentage)

    @property
    def current_month(self):
        df = pd.DataFrame(dict(month = pd.date_range(self.start_date, periods = self.total_months, freq = 'MS', name = "date")))
        df.index = range(1, len(df) + 1)
        try:
            return df.loc[df['month'].dt.strftime("%Y%m") == date.today().replace(day = 1).strftime("%Y%m")].index[0]
        except:
            return 0
    def get_self_amount(self, month):
        return (self.get_chit_amount(month) * ChitCustomers.objects.filter(chit = self, customer__self = True).count()) - self.commission_amount

    def get_month_number(self, month_name):
        month_list = [month.strftime("%Y%m") for month in pd.date_range(self.start_date, periods = self.total_months, freq = 'MS', name = "date")]
        return month_list.index(month_name)+1

    def get_chit_amount(self, month):
        bet_amount = self.get_bet_amount(month)
        return (bet_amount if bet_amount != None else \
            (self.total_value
                    if month == 1 or month == self.total_months
                    else self.total_value -(((self.total_value / 100) * float(self.interest_percentage)) * (self.total_months - month+1))
                ))/self.total_months

    def get_settlement_amount(self, month):
        bet_amount = self.get_bet_amount(month)
        return (bet_amount if bet_amount != None else
                self.total_value if month ==1 else (self.get_chit_amount(month)*self.total_months)) - self.commission_amount

    def get_bet_amount(self, month):
        month_list = pd.date_range(self.start_date, periods = month, freq = 'MS', name = "date")
        if ChitCustomers.objects.filter(chit = self, prefered_month = month).first() != None:
            return None
        settlement_details = ChitSettlement.objects.filter(chit = self, month = month_list[-1].strftime("%Y-%m-01")).values('betting').first()
        if settlement_details != None:
            if settlement_details['betting'] != None:
                return settlement_details['betting'][0][1]
        return None

    class Meta:
        db_table = "dim_chit"

    def get_absolute_url(self):
        return '/chit/'

class Customers(TimeStampedModel):

    name = models.CharField(max_length = 50)
    phone_number = models.CharField(max_length = 10, null = True)
    self = models.BooleanField(default = False)

    class Meta:
        db_table = "dim_customers"

    def get_absolute_url(self):
        return '/chit/customer'

class ChitCustomers(TimeStampedModel):

    chit = models.ForeignKey('Chit', on_delete = models.CASCADE, null = True)
    customer = models.ForeignKey('Customers', on_delete = models.CASCADE, null = True)
    prefered_month = models.IntegerField(null = True, default = None)

    class Meta:
        db_table = "fact_chit_customers"

class ChitPayment(TimeStampedModel):

    chit = models.ForeignKey('Chit', on_delete = models.CASCADE, null = True)
    month = models.DateField()
    customer = models.ForeignKey('Customers', on_delete = models.CASCADE, null = True)
    paid_date = models.DateField()

    class Meta:
        db_table = "fact_chit_payment"

class ChitSettlement(TimeStampedModel):

    chit = models.ForeignKey('Chit', on_delete = models.CASCADE, null = True)
    month = models.DateField()
    customer = models.ForeignKey('Customers', on_delete = models.CASCADE, null = True)
    paid = models.BooleanField(default = False)
    paid_date = models.DateField(null = True)
    amount = models.FloatField(default = 0)
    betting = JSONField(null = True)

    class Meta:
        db_table = "fact_chit_settlement"
        unique_together = ['chit', 'month']

