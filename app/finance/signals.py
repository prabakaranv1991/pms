from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Income, Expenses, MonthlyPayment
from datetime import date
 
@receiver(post_save, sender=Income)
@receiver(post_save, sender=Expenses)
def update_monthly_payment(sender, instance, **kwargs):
        filter = {'month__year__gte': date.today().year, 'month__month__gte': date.today().month}
        filter['income' if sender == Income else 'expense' ] = instance
        MonthlyPayment.objects.filter(**filter).update(amount=instance.amount)