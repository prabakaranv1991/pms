from django.contrib.auth.decorators import login_required
import json
from crud import *
from django.shortcuts import render
from django.http import HttpResponse
from dateutil.relativedelta import relativedelta
from chit.models import Chit, Customers, ChitCustomers, ChitPayment, ChitSettlement
from django.db.models import F, Q
import pandas as pd
from datetime import date, datetime
from chit.forms import *

@login_required
def chit(request, chit_id=None):
    chit_list = {data.id:data for data in Chit.objects.exclude(closed=True).order_by('-start_date')}
    customer_list = Customers.objects.order_by('name')
    customers = None
    chit_details = {}
    summary = {'total_current_month': 0, 'total': 0}
    if request.method == 'POST':
        if 'customer' in request.POST:
            if request.POST['customer'] != '':
                ChitCustomers.objects.create(chit_id = chit_id, customer_id=request.POST['customer'])
        for id, preference in {k:v for k, v in request.POST.items() if k.startswith('prefered_month')}.items():
            ChitCustomers.objects.filter(id = id[id.find("[")+1:id.rfind("]")]).update(prefered_month = None if int(preference) == 0 else preference)

        if 'betting_customer' in request.POST:
            if int(request.POST['betting_customer']) > 0:
                data = {'chit_id': chit_id, 'month': request.POST['betting_month']}
                chit_settlement = ChitSettlement.objects.filter(**data).values().first()
                betting = []
                if chit_settlement != None:
                    if chit_settlement['betting'] != None:
                        betting = chit_settlement['betting']
                betting.append([int(request.POST['betting_customer']), float(request.POST['betting_value'])])
                betting = sorted(betting, key=lambda x: x[1])
                ChitSettlement.objects.update_or_create(**data, defaults = {
                    'customer_id': betting[0][0],
                    'amount': betting[0][1],
                    'betting': betting
                })

    for id, chit_detail in chit_list.items():
        if chit_id == chit_detail.id:
            customers = ChitCustomers.objects.filter(chit_id=chit_id).order_by(F('prefered_month').asc(nulls_last=True), 'customer__name') if chit_detail.is_started == False else ChitCustomers.objects.filter(chit_id=chit_id).order_by('customer__name')
            customers = {data.customer_id:data for data in customers}
            customer_list = {data.id:data for data in Customers.objects.exclude(id__in=customers.keys()).order_by('name')}
        chit_details[chit_detail.id] = {}
        month_counter = 1
        betting_month = datetime.today()+ relativedelta(months=1)
        current_month = betting_month if int(date.today().strftime("%d")) >= 25 else date.today()
        for month in pd.date_range(chit_detail.start_date, periods = chit_detail.total_months, freq = 'MS', name = "date"):
            data_tmp = {
                'current_month': True if month.strftime("%Y%m") == current_month.strftime("%Y%m") else False,
                'completed':  True if month.strftime("%Y%m") <= date.today().strftime("%Y%m") else False,
                'preferred_to': ChitCustomers.objects.filter(chit=chit_detail, prefered_month=month_counter).values('customer', 'customer__name').first(),
                'chit_amount': chit_detail.get_chit_amount(month_counter),
                'settlement_amount': chit_detail.get_settlement_amount(month_counter),
                'commission_amount': chit_detail.commission_amount,
                'paid_customers': list(ChitPayment.objects.filter(chit=chit_detail, month=month.strftime("%Y-%m-01")).values_list('customer_id', flat=True)),
                'settlement_detail': ChitSettlement.objects.filter(chit=chit_detail, month=month.strftime("%Y-%m-01")).values('customer', 'customer__name', 'paid', 'paid_date', 'betting').first(),
            }
            data_tmp['pre_booked'] = True if data_tmp['preferred_to'] != None else False
            data_tmp['unpaid'] = chit_detail.total_months - len(data_tmp['paid_customers'])
            data_tmp['paid_amount'] = data_tmp['chit_amount'] * len(data_tmp['paid_customers'])
            data_tmp['outstanding_amount'] = data_tmp['chit_amount'] * data_tmp['unpaid']
            if data_tmp['current_month']: summary['total_current_month'] += data_tmp['outstanding_amount']
            if data_tmp['completed']: summary['total'] += data_tmp['outstanding_amount']
            data_tmp['paid_percentage'] = (len(data_tmp['paid_customers']) / chit_detail.total_months)*100
            if data_tmp['preferred_to'] == None and data_tmp['settlement_detail'] != None:
                betting_data = data_tmp['settlement_detail']['betting']
                if betting_data != None:
                    data_tmp['preferred_to'] = ChitCustomers.objects.filter(chit=chit_detail, customer_id=betting_data[0][0]).values('customer', 'customer__name').first()
            chit_details[chit_detail.id][month] = data_tmp
            month_counter += 1
    return render(request, "chit.html", {
        'chit_id': chit_id, 'chit': chit_list, 'customer_list': customer_list,
        'customers': customers, 'chit_details': chit_details, 'summary': summary
    })

@login_required
def chit_customers(request):
    customers = Customers.objects.all().order_by('name')
    return render(request, "customers.html", {'customers': customers})

@login_required
def payment_update(request):
    data = {
        'chit_id': request.POST.get('chit'),
        'month': request.POST.get('month'),
        'customer_id': request.POST.get('customer'),
        'paid_date': date.today()
    }
    ChitPayment.objects.create(**data)
    response = {'success': True}
    return HttpResponse(json.dumps(response), content_type="application/json")

@login_required
def settlement_update(request):
    data = {
        'chit_id': request.POST.get('chit'),
        'month': request.POST.get('month'),
    }
    ChitSettlement.objects.update_or_create(**data, defaults = {
        'customer_id': request.POST.get('customer'),
        'paid': request.POST.get('paid'),
        'paid_date': date.today() if request.POST.get('paid') else None,
        'amount': request.POST.get('amount')
    })
    response = {'success': True}
    return HttpResponse(json.dumps(response), content_type="application/json")

class ChitCreate(CreateView):
    form_class = ChitForm
    model = Chit
    title = 'Chit'
    exclude_fields = ['id', 'created', 'modified', 'deleted_at']

class ChitUpdate(UpdateView):
    form_class = ChitForm
    model = Chit
    title = 'Chit'

class CustomerList(ListView):
    model = Customers
    title = 'Customers'

class CustomerCreate(CreateView):
    form_class = CustomerForm
    model = Customers
    title = 'Customer'
    exclude_fields = ['id', 'created', 'modified', 'deleted_at']

class CustomerUpdate(UpdateView):
    form_class = CustomerForm
    model = Customers
    title = 'Customer'