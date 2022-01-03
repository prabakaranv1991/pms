from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Income, Expenses, MonthlyPayment
from datetime import date
 
@receiver(post_save, sender=Income)
def update_income(sender, instance, **kwargs):
        payments = MonthlyPayment.objects.filter(income=instance, month__gt=date.today())
        for payment in payments:
            payment.amount = instance.amount
            payment.save()

@receiver(post_save, sender=Expenses)
def update_expense(sender, instance, **kwargs):
        payments = MonthlyPayment.objects.filter(expense=instance, month__gt=date.today())
        for payment in payments:
            payment.amount = instance.amount
            payment.save()