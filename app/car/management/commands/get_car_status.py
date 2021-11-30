from django.core.management.base import BaseCommand
from app.car.models import CarOdometer
from datetime import date
from dateutil.relativedelta import relativedelta

class Command(BaseCommand):

    def add_arguments(self, parser):
        parser.add_argument('-from')
        parser.add_argument('-to')
        parser.add_argument('-limit')

    def handle(self, *args, **kwargs):
        if kwargs['limit']:
            kwargs['from'] = str(date.today() + relativedelta(days=-int(kwargs['limit'])))
            kwargs['to'] = str(date.today())
        CarOdometer.collect_status(from_date=kwargs['from'], to_date=kwargs['to'])



