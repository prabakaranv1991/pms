from django.db.models import Q
from django.db.models import ForeignKey
from django.conf import settings
from django.shortcuts import render
from django.views.generic import CreateView, DetailView, UpdateView, ListView
from braces import views

class ListView(views.SuperuserRequiredMixin, ListView):
    template_name = 'crud/listing.html'
    paginate_by = settings.PAGINATION_BY
    exclude_fields = ['id', 'created', 'modified']
    name_field = 'name'
    raise_exception = True

    def get_ordering(self):
        ordering = self.__class__.name_field
        return ordering

    def get_queryset(self):
        search_value = self.request.GET.get('search_value', '')
        queryset = super().get_queryset()
        if search_value != '':
            filter_objects = Q()
            fields = []
            for field in self.model._meta.fields:
                if field.name not in self.__class__.exclude_fields and isinstance(field, ForeignKey) == False:
                    fields.append(field.name)
                    kwargs = {'{0}__{1}'.format(field.name, 'icontains'): search_value}
                    filter_objects |= Q(**kwargs)
            queryset = queryset.filter(filter_objects)
        return queryset

    def get_context_data(self, **kwargs):
        ctx = super().get_context_data(**kwargs)
        ctx['title'] = self.__class__.title
        ctx['name_field'] = self.__class__.name_field
        ctx['field_type'] = {}
        ctx['fields'] = {}
        ctx['search_value'] = self.request.GET.get('search_value', '')
        ctx['links'] = []
        try:
            ctx['links'] = self.__class__.links
        except:
            pass
        for field in self.model._meta.fields:
            if field.name not in self.__class__.exclude_fields:
                ctx['fields'][field.name] = field.name.replace("_", " ").title()
                ctx['field_type'][field.name] = field.get_internal_type()
        return ctx

class CreateView(views.SuperuserRequiredMixin, CreateView):
    template_name = 'crud/edit.html'
    raise_exception = True

    def get(self, request, *args, **kwargs):
        context = {'form': self.__class__.form_class, 'title': self.title}
        return render(request, 'crud/edit.html', context)

class DetailView(views.SuperuserRequiredMixin, DetailView):
    template_name = 'crud/detail.html'
    exclude_fields = ['id', 'created', 'modified']
    name_field = 'name'
    raise_exception = True

    def get_context_data(self, **kwargs):
        context = DetailView.get_context_data(self, **kwargs)
        context['title'] = self.title+" - "+str(getattr(context['object'], self.__class__.name_field))
        context['fields'] = {}
        context['field_type'] = {}
        for field in self.model._meta.get_fields():
            if field.concrete and not (field.is_relation or field.one_to_one or(field.many_to_one and field.related_model)):
                if field.name not in self.__class__.exclude_fields:
                    context['fields'][field.name] = field.name.replace("_", " ").title()
                    context['field_type'][field.name] = field.get_internal_type()
        return context

class UpdateView(views.SuperuserRequiredMixin, UpdateView):
    template_name = 'crud/edit.html'
    name_field = 'name'
    raise_exception = True
    slug_field = "pk"
    slug_url_kwarg = "pk"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = self.__class__.title + ' - ' + str(getattr(context['object'], self.__class__.name_field))
        return context
