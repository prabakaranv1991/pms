# Generated by Django 3.0.7 on 2021-09-07 12:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('chit', '0005_remove_chitcustomers_prefered_month'),
    ]

    operations = [
        migrations.AddField(
            model_name='chitcustomers',
            name='prefered_month',
            field=models.IntegerField(default=0),
        ),
    ]
