# Generated by Django 5.0.7 on 2024-08-07 23:15

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Equipamiento', '0003_equipo_categoria_equipo_lab_alter_equipo_id'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='equipo',
            name='categoria',
        ),
    ]
