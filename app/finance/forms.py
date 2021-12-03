from django import forms
from finance.models import Income, FinanceSource, Expenses, Credit

class FinanceSourceForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = FinanceSource
        fields = '__all__'
        exclude = ('created', 'modified', )

class IncomeForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = Income
        fields = '__all__'
        exclude = ('created', 'modified', )

class ExpenseForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = Expenses
        fields = '__all__'
        exclude = ('created', 'modified', )

class CreditForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = Credit
        fields = '__all__'
        exclude = ('created', 'modified', )