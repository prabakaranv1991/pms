from django.db import models
from django.db.models import F, Q, Sum
from django.utils import timezone
from abstract_models import TimeStampedModel
from datetime import date

class FinanceSource(TimeStampedModel):
    name = models.CharField(max_length = 50)

    class Meta:
        db_table = "dim_finance_source"

    def get_absolute_url(self):
        return '/finance/finance_source/'

    def __str__(self):
        return self.name

class Income(TimeStampedModel):
    type_choices = [
        ("salary", "Salary"),
        ("finance", "Finance"),
        ("car_rental", "Car Rental"),
        ("emi", "EMI"),
        ("rent", "Rent"),
        ("credit", "Credit Return"),
        ("others", "Others"),
    ]
    name = models.CharField(max_length = 50)
    source = models.ForeignKey('FinanceSource', on_delete = models.CASCADE)
    type = models.CharField(max_length = 50, choices = type_choices)
    _amount = models.DecimalField(max_digits = 15, decimal_places = 2, db_column = 'amount')
    status = models.BooleanField(default = True)
    start_date = models.DateField()
    end_date = models.DateField(null = True, blank = True)
    pay_type = models.IntegerField(default = 1, choices = [(1, "Fixed"), (2, "Changeable")])
    sort_order = models.IntegerField(default = 999)
    finance = models.ForeignKey('FinanceLoan', on_delete = models.CASCADE, null = True, blank = True)

    class Meta:
        db_table = "dim_income"

    @property
    def amount(self):
        if self.finance:
            finance = FinanceUtilized.objects.filter(finance=self.finance, source=self.source).order_by('-created').first()
            return ((finance.amount / 100) * self.finance.roi) / 12
        return self._amount

    @amount.setter
    def amount(self, value):
        self._amount = value

    def get_absolute_url(self):
        return '/finance/income/'

class Expenses(TimeStampedModel):
    type_choices = [
        ("rental", "Rental"),
        ("loan", "Loan"),
        ("emi", "EMI"),
        ("finance", "Finance"),
        ("bill", "Bill"),
        ("chit", "Chit"),
        ("savings", "Savings"),
        ("house_expense", "House Expense"),
        ("repayment", "RE-Payment"),
        ("credit_card", "Credit Card"),
        ("others", "Others"),
    ]
    name = models.CharField(max_length = 50)
    type = models.CharField(max_length = 50, choices = type_choices)
    _amount = models.DecimalField(max_digits = 15, decimal_places = 2, db_column = 'amount')
    start_date = models.DateField()
    end_date = models.DateField(null = True, blank = True)
    pay_type = models.IntegerField(choices = [(1, "Fixed"), (2, "Changeable")])
    status = models.BooleanField(default = True)
    sort_order = models.IntegerField(default = 999)
    savings = models.BooleanField(default = False)
    chit = models.ForeignKey('chit.Chit', on_delete = models.CASCADE, null = True, blank = True)
    finance = models.ForeignKey('FinanceLoan', on_delete = models.CASCADE, null = True, blank = True)
    month = date.today().strftime("%Y-%m-%d")

    class Meta:
        db_table = "dim_expences"

    def get_absolute_url(self):
        return '/finance/expense/'

    def set_month(self, month):
        self.month = month

    @property
    def amount(self):
        if self.chit:
            if self.chit.is_started:
                return self.chit.get_self_amount(self.chit.get_month_number(self.month[:-3].replace("-", "")))
        if self.finance and self.type != 'repayment':
            return self.finance.interest_amount
        return self._amount

    @amount.setter
    def amount(self, value):
        self._amount = value

class MonthlyPayment(TimeStampedModel):
    month = models.DateField(default = timezone.now)
    income = models.ForeignKey('Income', on_delete = models.CASCADE, null = True)
    expense = models.ForeignKey('Expenses', on_delete = models.CASCADE, null = True)
    credit = models.ForeignKey('Credit', on_delete = models.CASCADE, null = True)
    amount = models.DecimalField(max_digits = 15, decimal_places = 2)
    paid_amount = models.DecimalField(max_digits = 15, decimal_places = 2, null = True)
    paid_date = models.DateField(null = True)

    class Meta:
        db_table = "fact_monthly_payment"
        unique_together = ['month', 'income', 'expense']

    @staticmethod
    def pending_amount(month=date.today().strftime("%Y-%m-01")):
        payments = MonthlyPayment.objects.filter(month=month)
        pending_amount = 0
        for payment in payments:
            pending_amount += payment.amount-payment.paid_amount
        return pending_amount

class CreditManager(models.Manager):

    def get_queryset(self):
        return super().get_queryset().filter(~Q(amount=F('paid_amount')))


class Credit(TimeStampedModel):
    name = models.TextField(null = True)
    expected_date = models.DateField(null = True, blank = True)
    source = models.ForeignKey('FinanceSource', on_delete = models.CASCADE)
    amount = models.DecimalField(max_digits = 15, decimal_places = 2)
    paid_amount = models.DecimalField(max_digits = 15, decimal_places = 2, null = True)
    paid_date = models.DateField(null = True, blank = True)
    active = CreditManager()
    all_objects = models.Manager()

    class Meta:
        db_table = "fact_credit"

    def get_absolute_url(self):
        return '/finance/credit/'

    @staticmethod
    def outstanding():
        credit = Credit.active.aggregate(total_amount = Sum('amount'))
        return 0 if credit['total_amount'] is None else credit['total_amount']

class FinanceLoan(TimeStampedModel):
    name = models.CharField(max_length = 50)
    loan_amount = models.DecimalField(max_digits = 15, decimal_places = 2)
    utilized_amount = models.DecimalField(max_digits = 15, decimal_places = 2)
    roi = models.DecimalField(max_digits = 15, decimal_places = 2)
    status = models.BooleanField(default = True)

    class Meta:
        db_table = "dim_finance_loan"

    def __str__(self):
        return self.name

    @property
    def interest_amount(self):
        return ((self.utilized_amount/100)*self.roi)/12

class FinanceUtilized(TimeStampedModel):
    finance = models.ForeignKey('FinanceLoan', on_delete = models.CASCADE)
    source = models.ForeignKey('FinanceSource', on_delete = models.CASCADE)
    amount = models.DecimalField(max_digits = 15, decimal_places = 2)
    paid_amount = models.DecimalField(max_digits = 15, decimal_places = 2, null = True)
    paid_date = models.DateField(null = True, blank = True)
    payment_type = models.CharField(max_length = 50, choices = [("repayment", "Re-Payment"), ("withdraw", "Withdraw")])
    status = models.BooleanField(default = True)

    class Meta:
        db_table = "fact_finance_utilized"

    @staticmethod
    def utilized(finance):
        data_tmp = {}
        source_list = []
        for utilized in FinanceUtilized.objects.filter(finance=finance).order_by('paid_date', 'source__name'):
            if utilized.paid_date not in data_tmp: data_tmp[utilized.paid_date] = {}
            data_tmp[utilized.paid_date][utilized.source.id] = [((utilized.amount / 100) * finance.roi) / 12,
                                                                utilized.amount, utilized.paid_amount,
                                                                utilized.payment_type]
            if utilized.source not in source_list: source_list.append(utilized.source)
        return source_list,data_tmp

class Emi(TimeStampedModel):
    card = models.ForeignKey('other.Card', on_delete=models.CASCADE)
    source = models.ForeignKey('FinanceSource', on_delete = models.CASCADE, null=True, blank=True)
    emi_amount = models.DecimalField(max_digits = 15, decimal_places = 2)
    start_date = models.DateField()
    end_date = models.DateField()

    class Meta:
        db_table = "fact_emi"

    def get_absolute_url(self):
        return '/finance/emi/'

class LoansManager(models.Manager):

    def get_queryset(self):
        return super().get_queryset().filter(~Q(total_amount=F('paid_amount')))

class Loans(TimeStampedModel):
    loan_type = [
        ("personal", "Personal"),
        ("jewel", "Jewel"),
        ("car", "Car"),
        ("od", "Over Draft"),
        ("others", "Others"),
    ]
    bank = [
        ("icici", "ICICI"),
        ("bajaj", "Bajaj"),
        ("sbi", "SBI"),
        ("axis", "Axis"),
        ("others", "Others"),
    ]
    name = models.CharField(max_length = 100)
    type = models.CharField(max_length = 100, choices = loan_type)
    bank = models.CharField(max_length = 50, choices = bank)
    total_amount = models.DecimalField(max_digits = 15, decimal_places = 2)
    paid_amount = models.DecimalField(max_digits = 15, decimal_places = 2)
    start_date = models.DateField()
    end_date = models.DateField()
    status = models.BooleanField(default = True)
    priority = models.IntegerField(default = 999)
    
    active = LoansManager()
    all_objects = models.Manager()
    finance = models.ForeignKey('FinanceLoan', on_delete = models.CASCADE, null=True, blank=True)

    class Meta:
        db_table = "dim_loans"

    @staticmethod
    def outstanding():
        total_credit = 0
        try:
            for loans in Loans.active.all():
                total_credit = total_credit + (loans.total_amount - loans.paid_amount)
        except Exception as e:
            pass
        return total_credit

    def get_absolute_url(self):
        return '/loans/'