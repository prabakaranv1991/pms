import os, json
from django.http import HttpResponse
from django.conf import settings
from django.views.decorators.csrf import csrf_exempt
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

@csrf_exempt
def git(request):
    data = json.loads(request.body.decode('utf-8'))
    if data['head_commit']['message'] != 'Database Backup Upload':
        os.system('echo cd /home/praba_test >> /hostpipe')
        os.system('echo git pull >> /hostpipe')
        os.system('echo docker exec -it praba_test_web_1 python3 manage.py makemigrations >> /hostpipe')
        os.system('echo docker exec -it praba_test_web_1 python3 manage.py migrate >> /hostpipe')

    return HttpResponse('Successfully Pulled into the production server...')
