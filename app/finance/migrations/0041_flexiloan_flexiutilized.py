# Generated by Django 3.0.7 on 2021-10-26 14:43

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('finance', '0040_expenses_chit'),
    ]

    operations = [
        migrations.CreateModel(
            name='FlexiLoan',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('name', models.CharField(max_length=50)),
                ('loan_amount', models.DecimalField(decimal_places=2, max_digits=15)),
                ('roi', models.DecimalField(decimal_places=2, max_digits=15)),
                ('status', models.BooleanField(default=True)),
            ],
            options={
                'db_table': 'dim_flexi_loan',
            },
        ),
        migrations.CreateModel(
            name='FlexiUtilized',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('amount', models.DecimalField(decimal_places=2, max_digits=15)),
                ('paid_amount', models.DecimalField(decimal_places=2, max_digits=15, null=True)),
                ('paid_date', models.DateField(blank=True, null=True)),
                ('status', models.BooleanField(default=True)),
                ('flexi', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='finance.FlexiLoan')),
                ('source', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='finance.FinanceSource')),
            ],
            options={
                'db_table': 'fact_flexi_utilized',
            },
        ),
    ]
