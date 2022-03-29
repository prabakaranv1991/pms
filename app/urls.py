from django.contrib import admin
from django.urls import path
from django.conf.urls import include, url
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.conf.urls.static import static
from dashboard import dashboard
from car.views import *
from chit.views import *
from finance.views import *
from other.views import *

def handler404(request, *args, **argv):
    return HttpResponseRedirect('/home')

handler404 = handler404

chit = [
    path('', chit, name="chit"),
    path('<int:chit_id>/', chit, name="chit"),
    path('create/', login_required(ChitCreate.as_view()), name='chit_create'),
    path('<str:pk>/update/', login_required(ChitUpdate.as_view()), name='chit_update'),
    path('customer/', login_required(CustomerList.as_view()), name='chit_customers'),
    path('customer/create/', login_required(CustomerCreate.as_view()), name='chit_customer_create'),
    path('customer/<str:pk>/update/', login_required(CustomerUpdate.as_view()), name='chit_customer_update'),
    path('payment/update', payment_update, name='chit_customers'),
    path('settlement/update', settlement_update, name='chit_customers'),
]
finance = [
    path('', finance, name="chit"),
    path('finance_source/', login_required(FinanceSourceList.as_view()), name="finance_source_list"),
    path('finance_source/create/', login_required(FinanceSourceCreate.as_view()), name="finance_source_create"),
    path('finance_source/<str:pk>/update/', login_required(FinanceSourceUpdate.as_view()), name='finance_source_update'),
    path('income/', login_required(IncomeList.as_view()), name="income_list"),
    path('income/create/', login_required(IncomeCreate.as_view()), name="income_create"),
    path('income/<str:pk>/update/', login_required(IncomeUpdate.as_view()), name='income_update'),
    path('expense/', login_required(ExpenseList.as_view()), name="expense_list"),
    path('expense/create/', login_required(ExpenseCreate.as_view()), name="expense_create"),
    path('expense/<str:pk>/update/', login_required(ExpenseUpdate.as_view()), name='expense_update'),
    path('credit/', login_required(CreditList.as_view()), name="credit_list"),
    path('credit/create/', login_required(CreditCreate.as_view()), name="credit_create"),
    path('credit/<str:pk>/update/', login_required(CreditUpdate.as_view()), name='credit_update'),
    path('emi/', login_required(EmiList.as_view()), name="emi_list"),
    path('emi/create/', login_required(EmiCreate.as_view()), name="emi_create"),
    path('emi/<str:pk>/update/', login_required(EmiUpdate.as_view()), name='emi_update'),
    path('loan/', finance_loan, name='finance_loan'),
]
loans = [
    path('', login_required(LoansList.as_view()), name="loans_list"),
    path('create/', login_required(LoansCreate.as_view()), name="loans_create"),
    path('<str:pk>/update/', login_required(LoansUpdate.as_view()), name='loans_update'),
]

other = [
    path('password/', login_required(PasswordList.as_view()), name='password'),
    path('password/create/', login_required(PasswordCreate.as_view()), name='password_create'),
    path('password/<str:pk>/update/', login_required(PasswordUpdate.as_view()), name='password_update'),
    path('card/', login_required(CardList.as_view()), name='card'),
    path('card/create/', login_required(CardCreate.as_view()), name='card_create'),
    path('card/<str:pk>/update/', login_required(CardUpdate.as_view()), name='card_update'),
]

urlpatterns = [
    path('', include('django.contrib.auth.urls')),
    url('home/', dashboard, name='dashboard'),
    url('car/status/$', car_status, name="car_status"),
    path('chit/', include(chit)),
    path('finance/', include(finance)),
    path('loans/', include(loans)),
    path('other/', include(other)),
    path('admin/', admin.site.urls),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

