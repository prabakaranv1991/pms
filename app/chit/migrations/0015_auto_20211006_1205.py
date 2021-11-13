# Generated by Django 3.0.7 on 2021-10-06 06:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('chit', '0014_auto_20211006_1118'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='chit',
            name='commision_percentage',
        ),
        migrations.AddField(
            model_name='chit',
            name='commission_percentage',
            field=models.DecimalField(decimal_places=2, default=1.5, max_digits=15),
        ),
    ]
