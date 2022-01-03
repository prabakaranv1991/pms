from crud import *
from other.models import *
from other.forms import *

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

class CardList(ListView):
    model = Card
    title = 'Card'
    name_field = 'name'

class CardCreate(CreateView):
    form_class = CardForm
    model = Card
    title = 'Card'

class CardUpdate(UpdateView):
    form_class = CardForm
    model = Card
    title = 'Card'