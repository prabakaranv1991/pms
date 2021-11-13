from django import forms
from app.chit.models import Chit, Customers

class ChitForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = Chit
        fields = '__all__'
        exclude = ('created', 'modified', )

class CustomerForm(forms.ModelForm):
    required_css_class = 'required'

    class Meta:
        model = Customers
        fields = '__all__'
        exclude = ('created', 'modified', )