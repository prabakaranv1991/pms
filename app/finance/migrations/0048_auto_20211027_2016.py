# Generated by Django 3.0.7 on 2021-10-27 14:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('finance', '0047_income_finance'),
    ]

    operations = [
        migrations.RenameField(
            model_name='expenses',
            old_name='amount',
            new_name='_amount',
        ),
        migrations.RenameField(
            model_name='income',
            old_name='amount',
            new_name='_amount',
        ),
        migrations.AlterField(
            model_name='expenses',
            name='_amount',
            field=models.DecimalField(db_column='amount', decimal_places=2, max_digits=15),
        ),
        migrations.AlterField(
            model_name='income',
            name='_amount',
            field=models.DecimalField(db_column='amount', decimal_places=2, max_digits=15),
        ),
    ]
