# Generated by Django 3.0.7 on 2021-10-13 07:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('finance', '0005_auto_20211006_1125'),
    ]

    operations = [
        migrations.AddField(
            model_name='monthlypayment',
            name='amount',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=15),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='monthlypayment',
            name='paid_amount',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=15),
            preserve_default=False,
        ),
    ]
