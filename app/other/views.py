from crud import *
from other.models import Password
from other.forms import PasswordForm

class PasswordList(ListView):
    model = Password
    title = 'Password'
    name_field = 'name'

class PasswordCreate(CreateView):
    form_class = PasswordForm
    model = Password
    title = 'Password'

class PasswordUpdate(UpdateView):
    form_class = PasswordForm
    model = Password
    title = 'Password'
