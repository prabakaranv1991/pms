from babel.numbers import format_currency, format_number

def get_request_data(request, key):
    return {k[k.find("[")+1:k.rfind("]")]: v for k, v in request.POST.items() if k.startswith(key+'[')}.items()

def model_to_dict(model, prefix=None):
    data = {}
    for field in model._meta.get_fields():
        try:
            data[field.name] = getattr(model, field.name)
            if isinstance(data[field.name], str):
                data[field.name] = getattr(model, "get_"+field.name+"_display")
            elif len(field.choices) > 0:
                data[field.name] = dict(field.choices)[getattr(model, field.name)]
        except:
            pass
    return {prefix: data} if prefix != None else data

def merge_dict(dict1, dict2, exclude=[]):
    dict = dict1.copy()
    for key in exclude:
        del dict2[key]
    dict.update(dict2)
    return dict

def number_value(val, decimal_places=0):
    try:
        return format_currency(int(val), 'INR', locale='en_IN') if decimal_places == 0 else format_number(val, locale='en_IN')
    except:
        return val