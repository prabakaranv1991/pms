from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from django.db.models import Sum
from finance.models import MonthlyPayment, Credit
from car.views import car_status
from datetime import date

@login_required
def dashboard(request):
    dashboard_data = {'expense_graph_data': expense_graph_data(),
                      'car_status': car_status(request, True),
                      'summary_data': summary_data()}
    return render(request, "dashboard.html", dashboard_data)

def expense_graph_data():
    expense_graph_data = {'header': [], 'values': {}}
    month_list = []
    expenses = []
    data_tmp = {}
    finance_type = ['expense__type', 'income__type']
    for index, type in enumerate(finance_type):
        expense_summary = MonthlyPayment.objects.values('month', type).order_by('month', type).annotate(total_amount = Sum('amount'))
        for data in expense_summary:
            if data[type] == None: continue
            data[type] = data[type].replace("_", " ").title()
            data[type] = data[type]+"("+ ("Expense" if index == 0 else "Income") +")"
            if data['month'] not in month_list: month_list.append(data['month'])
            if data[type] not in expenses: expenses.append(data[type])
            if data['month'] not in data_tmp: data_tmp[data['month']] = {}
            data_tmp[data['month']][data[type]] = data['total_amount']
            expense_graph_data['values'][data[type]] = [index, []]
    credit_summary = MonthlyPayment.objects.filter(credit__isnull = False).values('month').order_by('month').annotate(total_amount = Sum('amount'))
    for data in credit_summary:
        data['income__type'] = "Credit-Income"
        if data['month'] not in month_list: month_list.append(data['month'])
        if data['income__type'] not in expenses: expenses.append(data['income__type'])
        if data['month'] not in data_tmp: data_tmp[data['month']] = {}
        data_tmp[data['month']][data['income__type']] = data['total_amount']
        expense_graph_data['values'][data['income__type']] = [1, []]
    for month in month_list:
        expense_graph_data['header'].append(month)
        for expense in expenses:
            expense_graph_data['values'][expense][1].append(0 if expense not in data_tmp[month] else data_tmp[month][expense])
    return expense_graph_data

def summary_data(month=date.today().strftime("%Y-%m-01")):
    income_total = 0
    expense_total = 0
    for payment in MonthlyPayment.objects.filter(month = month).select_related().order_by('income__sort_order','expense__sort_order'):
        if payment.income != None or payment.credit != None: income_total += payment.amount
        if payment.expense != None: expense_total += payment.amount
    summary_data = {
        'total credit': [Credit.outstanding(), '/finance/credit', 'credit-card', 'danger'],
        'payment pending': [MonthlyPayment.pending_amount(), '/finance', 'bank', 'success'],
        'cash': [income_total - expense_total, '/finance', 'money', 'info']
    }
    return summary_data