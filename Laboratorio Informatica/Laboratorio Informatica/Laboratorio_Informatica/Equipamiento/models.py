from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
class Equipo(models.Model):
    CABLE = 'cable'
    NETBOOK = 'netbook'
    NET = 'net'
    OTROS = 'otros'
    MONITOR = 'monitor'
    
    REPARACION = 'reparacion'
    DISPONIBLE = 'disponible'
    PRESTADO = 'prestado'
    
    TIPO_CHOICES = [
        (CABLE, 'Cable'),
        (NETBOOK, 'Netbook'),
        (NET, 'Net'),
        (OTROS, 'Otros'),
        (MONITOR, 'Monitor'),
    ]
    
    ESTADO_CHOICES = [
        (REPARACION, 'Reparacion'),
        (DISPONIBLE, 'Disponible'),
        (PRESTADO, 'Prestado'),
    ]
    id = models.AutoField(primary_key=True)
    marca = models.CharField(max_length=50, null=True, blank=True)
    nro_serie = models.CharField(max_length=30)
    tipo = models.CharField(max_length=10, choices=TIPO_CHOICES)
    estado = models.CharField(max_length=10, choices=ESTADO_CHOICES)
    descripcion = models.TextField()
    lab = models.CharField(max_length=40, null=True, blank=True)
    imagen = models.ImageField(upload_to='laboratorio/', null=True, blank=True) 
    
    def __str__(self):
        return f"{self.id} - {self.nro_serie} - {self.tipo} - {self.estado} - {self.descripcion} - {self.lab}"
    
class Prestamo(models.Model):
    
    BASES_DE_DATOS = 'Base de datos'
    APLICACION_NUEVAS_TECNOLOGIAS = 'Aplicacion de nuevas tecnologias'
    PROGRAMACION = 'Programacion'
    LABORATORIO_INFORMATICA = 'Laboratorio informatica'
    
    MATERIA_CHOICES = [
        (BASES_DE_DATOS, 'Base de Datos'),
        (APLICACION_NUEVAS_TECNOLOGIAS, 'Aplicación de Nuevas Tecnologias'),
        (PROGRAMACION, 'Programacion'),
        (LABORATORIO_INFORMATICA, 'Laboratorio de Informatica'),
    ]

    equipo = models.ForeignKey(Equipo, on_delete=models.CASCADE)
    alumno = models.ForeignKey(User, on_delete=models.CASCADE)
    fecha_prestamo = models.DateTimeField(auto_now_add=True)
    fecha_devolucion = models.DateTimeField(null=True, blank=True)
    materia = models.CharField(max_length=50, choices=MATERIA_CHOICES,null=True, blank=True)

    def devolver(self):
        self.fecha_devolucion = timezone.now()
        self.equipo.estado = 'disponible'
        self.equipo.save()
        self.save()

    def __str__(self):
        return f"Préstamo de {self.equipo} a {self.alumno} de la materia {self.materia} en {self.fecha_prestamo}"

