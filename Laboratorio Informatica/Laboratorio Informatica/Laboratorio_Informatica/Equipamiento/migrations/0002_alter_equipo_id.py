# Generated by Django 5.0.6 on 2024-08-02 23:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Equipamiento', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='equipo',
            name='id',
            field=models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID'),
        ),
    ]
