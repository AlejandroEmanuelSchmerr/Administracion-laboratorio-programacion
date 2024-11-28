from django.contrib import admin
from Equipamiento import models
from .models import Equipo
# Register your models here.
class AdmEquipo(admin.ModelAdmin):
    list_display=('id','marca','nro_serie','tipo','estado','descripcion','lab','imagen')

admin.site.register(Equipo,AdmEquipo)
