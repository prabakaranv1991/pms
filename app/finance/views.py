from crud import *
from django.db.models import Q
from finance.forms import *
from finance.models import *
from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from datetime import date
from dateutil.relativedelta import relativedelta
from utils import *
import pandas as pd

class classproperty(object):
    def __init__(self, fget):
        self.fget = fget
    def __get__(self, owner_self, owner_cls):
        return self.fget(owner_cls)

@login_required
def finance(request):
    month_list = pd.date_range('2021-10-01', date.today() + relativedelta(months=+9), freq='MS', name="date")
    month = request.GET.get('month', date.today().replace(day=1).strftime("%Y-%m-%d"))
    monthly_payment_data = {'income': [], 'expense': [], 'credit': [], 'expense_amount': {},
                            'income_total': 0, 'expense_total': 0,
                            'income_paid': 0, 'expense_paid': 0,
                            'income_balance': 0, 'expense_balance': 0,
                            'income_list': [], 'expense_list': [],
                            'summary': {'cash': 0, 'savings': 0}, 'income_group': {},
                            'row_span': {'income': {}, 'expense': {}}}
    if request.method == 'POST':
        MonthlyPayment.objects.filter(month=month).delete()
        for type in ['income', 'credit', 'expense']:
            for id, amount in get_request_data(request, type):
                data = {'amount': amount, 'month': request.POST.get('month'), type + '_id': id}
                if float(amount) > 0: MonthlyPayment.objects.create(**data)
        if request.POST.get('new_income') != "":
            data = {'month': request.POST.get('month')}
            if request.POST.get('new_income')[0] == "c":
                data['amount'] = Credit.all_objects.get(pk=int(request.POST.get('new_income')[1:])).amount
                data['credit_id'] = int(request.POST.get('new_income')[1:])
            else:
                data['amount'] = Income.objects.get(pk=request.POST.get('new_income')).amount
                data['income_id'] = int(request.POST.get('new_income'))
            MonthlyPayment.objects.create(**data)
        if request.POST.get('new_expense') != "":
            expense = Expenses.objects.get(pk=request.POST.get('new_expense'))
            expense.set_month(month)
            MonthlyPayment.objects.create(amount=expense.amount, month=request.POST.get('month'), income_id=None,
                                          expense_id=request.POST.get('new_expense'))

        for type in ['income', 'credit', 'expense']:
            paid_date = {id: date_tmp for id, date_tmp in get_request_data(request, type + '_paid_date')}
            for id, amount in get_request_data(request, type + '_paid'):
                filter_param = {'month': request.POST.get('month'), type + '_id': id}
                update_value = {'paid_amount': 0, 'paid_date': None}
                try:
                    if float(amount) > 0:
                        update_value['paid_amount'] = float(amount)
                        update_value['paid_date'] = paid_date[id]
                except:
                    pass
                MonthlyPayment.objects.filter(**filter_param).update(**update_value)

    for payment in MonthlyPayment.objects.filter(month=month).select_related().order_by('income__sort_order',
                                                                                        'expense__sort_order'):
        for type in ['income', 'credit', 'expense']:
            if getattr(payment, type) != None:
                monthly_payment_data[type].append(
                    merge_dict(model_to_dict(getattr(payment, type)), model_to_dict(payment), ['id']))
                if type == 'credit':
                    payment.credit.paid_amount = payment.paid_amount
                    payment.credit.paid_date = payment.paid_date
                    payment.credit.save()
                    type = 'income'
                if type == 'expense': payment.expense.month = month
                monthly_payment_data[type + '_total'] += payment.amount
                monthly_payment_data[type + '_paid'] += payment.paid_amount if payment.paid_amount != None else 0
                monthly_payment_data[
                    type + '_balance'] += payment.amount - payment.paid_amount if payment.paid_amount != None else payment.amount
                if type == 'expense':
                    if payment.expense.savings:
                        monthly_payment_data['summary']['savings'] += payment.amount
                    else:
                        if payment.expense.get_type_display() not in monthly_payment_data['summary']:
                            monthly_payment_data['summary'][payment.expense.get_type_display()] = 0
                        monthly_payment_data['summary'][payment.expense.get_type_display()] += payment.amount
    try:
        monthly_payment_data['summary']['cash'] += monthly_payment_data['income_total'] - monthly_payment_data[
            'expense_total']
    except:
        pass
    if len(monthly_payment_data['income']) == 0:
        for type in ['income', 'credit', 'expense']:
            if type == 'credit':
                model_data = Credit.active.all()
            elif type == 'income':
                model_data = Income.objects.filter(Q(status=True), Q(start_date__lte=month), Q(end_date__gte=month) | Q(end_date=None))
            else:
                model_data = Expenses.objects.filter(Q(status=True), Q(start_date__lte=month), Q(end_date__gte=month) | Q(end_date=None))
            for data in model_data:
                data_tmp = {}
                for value in model_to_dict(data).items(): data_tmp[value[0].replace("_", "")] = value[1]
                if 'type' in model_to_dict(data).keys(): data_tmp['type'] = data.get_type_display()
                monthly_payment_data[type].append(data_tmp)
    else:
        monthly_payment_data['income_list'] = Income.objects.filter(Q(status=True), Q(start_date__lte=month), Q(end_date__gte=month) | Q(end_date=None)).exclude(id__in=[data['id'] for data in monthly_payment_data['income']]).values()
        monthly_payment_data['expense_list'] = Expenses.objects.filter(Q(status=True), Q(start_date__lte=month),Q(end_date__gte=month) | Q(end_date=None)).exclude(id__in=[data['id'] for data in monthly_payment_data['expense']]).values()
        monthly_payment_data['credit_list'] = Credit.active.exclude(id__in=[data['id'] for data in monthly_payment_data['credit']])

    max_rows_tmp = max([len(monthly_payment_data['income']) + len(monthly_payment_data['credit']),
                        len(monthly_payment_data['expense'])])
    extra_rows = {
        'income': range(max_rows_tmp - len(monthly_payment_data['income']) - len(monthly_payment_data['credit']) + 1),
        'expense': range(max_rows_tmp - len(monthly_payment_data['expense']) + 1)}

    for income in monthly_payment_data['income']:
        if income['source'] not in monthly_payment_data['income_group']:
            monthly_payment_data['income_group'][income['source']] = 0
            monthly_payment_data['row_span']['income'][income['source']] = 0
        monthly_payment_data['income_group'][income['source']] += int(income['amount'])
        monthly_payment_data['row_span']['income'][income['source']] += 1
    for expense in monthly_payment_data['expense']:
        if expense['type'] not in monthly_payment_data['row_span']['expense']: monthly_payment_data['row_span']['expense'][expense['type']] = 0
        monthly_payment_data['row_span']['expense'][expense['type']] += 1
    return render(request, "finance.html",
                  {'monthly_payment_data': monthly_payment_data, 'extra_rows': extra_rows, 'month_list': month_list,
                   'month': month})


class IncomeList(ListView):
    model = Income
    title = 'Income'
    name_field = 'sort_order'
    links = ['<a href="/finance/finance_source/" class="card-header-action"><b>Finance Source</b></a>']


class IncomeCreate(CreateView):
    form_class = IncomeForm
    model = Income
    title = 'Income'


class IncomeUpdate(UpdateView):
    form_class = IncomeForm
    model = Income
    title = 'Income'


class FinanceSourceList(ListView):
    model = FinanceSource
    title = 'Finance Source'


class FinanceSourceCreate(CreateView):
    form_class = FinanceSourceForm
    model = FinanceSource
    title = 'Finance Source'


class FinanceSourceUpdate(UpdateView):
    form_class = FinanceSourceForm
    model = FinanceSource
    title = 'Income Source'


class ExpenseList(ListView):
    model = Expenses
    title = 'Expenses'
    name_field = ['pay_type' ,'name']


class ExpenseCreate(CreateView):
    form_class = ExpenseForm
    model = Expenses
    title = 'Expenses'


class ExpenseUpdate(UpdateView):
    form_class = ExpenseForm
    model = Expenses
    title = 'Expenses'


class CreditList(ListView):
    model = Credit
    title = 'Credit'
    name_field = 'source'
    queryset = Credit.active

    def get_ordering(self):
        return ['paid_amount', '-amount']

    links = ["Total Outstanding: <b>" + number_value(Credit.outstanding()) + "</b>",
             '<a href="/finance/finance_source/" class="card-header-action"><b>Finance Source</b></a>',
             '<a href="/finance/credit?list=all_objects" class="card-header-action"><b>All</b></a>', ]


class CreditCreate(CreateView):
    form_class = CreditForm
    model = Credit
    title = 'Credit'


class CreditUpdate(UpdateView):
    form_class = CreditForm
    model = Credit
    title = 'Credit'


@login_required
def finance_loan(request):
    if request.method == 'POST':
        for id, amount in get_request_data(request, 'paid'):
            id = id.split("_")
            try:
                utilized = FinanceUtilized.objects.filter(finance_id=id[0], source_id=id[1]).order_by('-created').first()
                outstanding_amount = float(utilized.amount) - float(amount)
                FinanceUtilized.objects.create(finance_id=id[0], source_id=id[1],
                                               amount=outstanding_amount,
                                               paid_amount=float(amount), paid_date=date.today(),
                                               payment_type='repayment')
                finance_source = FinanceSource.objects.get(id=id[1])
                if str(finance_source).lower() == 'self':
                    loan_data = FinanceLoan.active.get(id=id[0])
                    loan_data.self_utilized_amount = outstanding_amount
                    loan_data.paid_amount = float(loan_data.paid_amount) + float(amount)
                    loan_data.save()
            except Exception as e:
                print(amount)
                pass
        for id, amount in get_request_data(request, 'withdraw'):
            id = id.split("_")
            try:
                utilized = FinanceUtilized.objects.filter(finance_id=id[0], source_id=id[1]).order_by(
                    '-created').first()
                FinanceUtilized.objects.create(finance_id=id[0], source_id=id[1],
                                               amount=float(utilized.amount) + float(amount),
                                               paid_amount=float(amount), paid_date=date.today(),
                                               payment_type='withdraw')
            except:
                pass
        self_finance_source = FinanceSource.objects.get(name='Self')
        for finance in FinanceLoan.active.all():
            if finance.self_utilized_amount == 0:
                utilized = FinanceUtilized.objects.filter(finance=finance, source=self_finance_source).order_by('-created').first()
                finance.self_utilized_amount = utilized.amount
                finance.paid_amount = float(finance.paid_amount) + float(0 if utilized.paid_amount is None else utilized.paid_amount)
                finance.save()
            source_list, data_tmp = FinanceUtilized.utilized(finance)
            pre_data = {}
            finance_data = {}
            for date_str in data_tmp.keys():
                for source in source_list:
                    try:
                        finance_data[source.id] = data_tmp[date_str][source.id]
                        pre_data[source.id] = data_tmp[date_str][source.id]
                    except:
                        try:
                            finance_data[source.id] = [pre_data[source.id][0], pre_data[source.id][1],
                                                                            None, None]
                        except:
                            finance_data[source.id] = [0, 0, None, None]
            for source, data in finance_data.items():
                try:
                    income = Income.objects.get(source_id=source, finance=finance)
                    income.amount = data[0]
                    income.save()
                except:
                    pass
            total_outstanding = 0
            for data in FinanceUtilized.objects.filter(finance=finance).order_by('source_id', '-created').distinct('source_id'): 
                total_outstanding += data.amount
            finance.utilized_amount = total_outstanding
            finance.save()
            try:
                expense = Expenses.objects.get(~Q(pay_type=3), finance=finance)
                expense.amount = ((finance.utilized_amount / 100) * finance.roi) / 12
                expense.save()            
            except Exception as e:
                print(e)
                pass

    finance_details = {}
    total_emi = {}
    finance_data = {}
    source_list = {}
    for finance in FinanceLoan.active.filter(status=True).order_by('id'):
        finance_details[finance.id] = finance

        total_emi[finance.id] = [((finance.utilized_amount / 100) * finance.roi) / 12, finance.utilized_amount,
                                 finance.loan_amount - finance.utilized_amount]
        finance_data[finance.id] = {}
        source_list[finance.id], data_tmp = FinanceUtilized.utilized(finance)
        pre_data = {}
        for date_str in data_tmp.keys():
            finance_data[finance.id][date_str] = {}
            for source in source_list[finance.id]:
                try:
                    finance_data[finance.id][date_str][source.id] = data_tmp[date_str][source.id]
                    pre_data[source.id] = data_tmp[date_str][source.id]
                except:
                    try:
                        finance_data[finance.id][date_str][source.id] = [pre_data[source.id][0], pre_data[source.id][1],
                                                                         None, None]
                    except:
                        finance_data[finance.id][date_str][source.id] = [0, 0, None, None]

    return render(request, "finance_loan.html",
                  {'finance_details': finance_details, 'finance_loan': finance_data, 'source_list': source_list,
                   'total_emi': total_emi})

class EmiList(ListView):
    model = Emi
    title = 'Emi'
    name_field = 'card'


class EmiCreate(CreateView):
    form_class = EmiForm
    model = Emi
    title = 'Emi'


class EmiUpdate(UpdateView):
    form_class = EmiForm
    model = Emi
    title = 'Emi'

class LoansList(ListView):
    model = FinanceLoan
    title = 'Loans'

    def get_ordering(self):
        return 'priority'

    @classproperty
    def links(self):
        total_credit = 0
        try:
            for loans in FinanceLoan.active.all():
                total_credit = total_credit + (loans.self_utilized_amount)
        except Exception as e:            
            pass
        return ["Total Outstanding: <b>" + number_value(total_credit) + "</b>"]



class LoansCreate(CreateView):
    form_class = LoansForm
    model = FinanceLoan
    title = 'Loans'


class LoansUpdate(UpdateView):
    form_class = LoansForm
    model = FinanceLoan
    title = 'Loans'