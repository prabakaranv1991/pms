from django import forms
from other.models import Password

class PasswordForm(forms.ModelForm):
    required_css_class = 'required'
    password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = Password
        fields = '__all__'
        exclude = ('created', 'modified', )