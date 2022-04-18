from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Income, Expenses, MonthlyPayment
from datetime import date
 
@receiver(post_save, sender=Income)
@receiver(post_save, sender=Expenses)
def update_monthly_payment(sender, instance, **kwargs):
        filter = {'month__year__gte': date.today().year, 'month__month__gte': date.today().month, 'paid_amount': 0}
        filter['income' if sender == Income else 'expense' ] = instance
        if sender == Expenses and instance.pay_type == 'RE-Payment':
                return False
        MonthlyPayment.objects.filter(**filter).update(amount=instance.amount)
