# Generated by Django 5.0.7 on 2024-10-09 20:26

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Equipamiento', '0005_equipo_imagen_equipo_marca'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Prestamo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha_prestamo', models.DateTimeField(auto_now_add=True)),
                ('fecha_devolucion', models.DateTimeField(blank=True, null=True)),
                ('alumno', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('equipo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Equipamiento.equipo')),
            ],
        ),
    ]