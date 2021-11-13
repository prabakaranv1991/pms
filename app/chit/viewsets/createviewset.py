from app.chit.forms import *
from app.viewsets.create import CreateViewCustom

class ChitCreateView(CreateViewCustom):
    form_class = ChitForm
    title = 'Chit'

class CustomerCreateView(CreateViewCustom):
    form_class = CustomerForm
    title = 'Customer'