from django.urls import path
from . import views
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from .views import logout_view

urlpatterns = [
    path('', views.index, name='index'),
    path('login/', views.login, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('registrarse/', views.registrar, name='registrar'),
    path('equipos/modificacion/', views.modificacion, name='modificacion'),
    path('equipos/', views.listado_equipamientos, name='listado_equipamientos'),
    path('prestamo/realizar/<int:equipo_id>/', views.realizar_prestamo, name='realizar_prestamo'),
    path('prestamo/devolver/<int:prestamo_id>/', views.devolver_prestamo, name='devolver_prestamo'),
    path('alumno_inicio/', views.alumno_inicio, name='alumno_inicio'),
    path('mis_prestamos/', views.mis_prestamos, name='mis_prestamos'),
    path('listado_prestamos/',views.listado_prestamos,name='listado_prestamos'),
    path('download/<str:filename>/', views.descargaExcelModelo, name='Modelo'),
    path('CargaLto', views.CargaLote, name="Lote"),
]

urlpatterns+=static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)