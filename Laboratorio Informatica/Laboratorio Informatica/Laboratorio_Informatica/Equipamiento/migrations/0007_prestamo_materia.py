# Generated by Django 5.0.7 on 2024-10-09 19:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Equipamiento', '0006_prestamo'),
    ]

    operations = [
        migrations.AddField(
            model_name='prestamo',
            name='materia',
            field=models.CharField(blank=True, choices=[('Base de datos', 'Base de Datos'), ('Aplicacion de nuevas tecnologias', 'Aplicación de Nuevas Tecnologias'), ('Programacion', 'Programacion'), ('Laboratorio informatica', 'Laboratorio de Informatica')], max_length=50, null=True),
        ),
    ]
