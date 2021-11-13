# Generated by Django 3.0.7 on 2021-10-13 14:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('finance', '0013_auto_20211013_2004'),
    ]

    operations = [
        migrations.AddField(
            model_name='income',
            name='pay_type',
            field=models.IntegerField(choices=[(1, 'Fixed'), (2, 'Changeable')], default=1),
        ),
        migrations.AddField(
            model_name='income',
            name='type',
            field=models.CharField(choices=[('salary', 'salary'), ('finance', 'Finance'), ('car_rental', 'Car Rental')], default='salary', max_length=50),
            preserve_default=False,
        ),
    ]
