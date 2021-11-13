# Generated by Django 3.0.7 on 2021-10-21 03:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('finance', '0028_auto_20211020_2129'),
    ]

    operations = [
        migrations.AlterField(
            model_name='expenses',
            name='type',
            field=models.CharField(choices=[('rental', 'Rental'), ('loan', 'Loan'), ('emi', 'EMI'), ('bill', 'Bill'), ('chit', 'Chit'), ('savings', 'Savings'), ('house_expense', 'House Expense'), ('repayment', 'RE-Payment'), ('credit_card', 'Credit Card'), ('others', 'Others')], max_length=50),
        ),
    ]
