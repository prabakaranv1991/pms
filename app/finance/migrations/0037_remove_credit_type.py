# Generated by Django 3.0.7 on 2021-10-23 06:11

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('finance', '0036_auto_20211023_1115'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='credit',
            name='type',
        ),
    ]
