from math import ceil
from django import template
from django.urls import resolve
from babel.numbers import format_currency, format_number

register = template.Library()

@register.filter
def number_value(val, decimal_places=0):
    try:
        return format_currency(int(val), 'INR', locale='en_IN') if decimal_places == 0 else format_number(val, locale='en_IN')
    except Exception as e:
        return val

@register.filter
def menuicon(icon_str):
    return """<svg class="c-sidebar-nav-icon">
                    <use xlink:href="/static/assets/vendors/@coreui/icons/svg/free.svg#cil-{}"></use>
                </svg>""".format(icon_str)

@register.filter
def icon(icon_str):
    return """<svg class="c-icon">
                    <use xlink:href="/static/assets/vendors/@coreui/icons/svg/free.svg#cil-{}"></use>
                </svg>""".format(icon_str)

@register.filter
def get_item(dictionary, key):
    try:
        try:
            return getattr(dictionary, 'get_'+key+'_display')()
        except:
            pass
        return getattr(dictionary, key)
    except Exception as e:
        try:
            return dictionary[key]
        except Exception as e:
            return None
    return None

@register.simple_tag
def append(val, val1):
  return str(val)+str(val1)

@register.filter
def startswith(text, starts):
    return str(text).startswith(starts)

@register.filter
def percentage(value, arg):
    try:
        return round((int(value) / int(arg))*100)
    except (ValueError, ZeroDivisionError):
        return None

@register.filter
def sum_list(list):
    if isinstance(list, dict):
        return sum(list.items())
    else:
        return sum(list)

@register.simple_tag
def percentage_style(percentage):
    if percentage == 100:
        return 'success'
    elif percentage <= 50:
        return 'danger'
    elif percentage < 75:
        return 'warning'
    else:
        return 'info'

@register.simple_tag
def get_total_pending_amount(chit_data):
    outstanding_amount = 0
    for month, data in chit_data.items():
        if data['completed']:
            outstanding_amount += data['outstanding_amount']
    return int(outstanding_amount)
