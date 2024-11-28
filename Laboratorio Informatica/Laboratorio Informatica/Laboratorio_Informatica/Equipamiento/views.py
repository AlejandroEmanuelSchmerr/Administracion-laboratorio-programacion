from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
from django.contrib.auth.decorators import login_required
from .forms import FormEquipo, FormLogin, FormRegistrar,FormPrestamo
from .models import Equipo, Prestamo
from django.utils import timezone
from django.contrib.auth.models import Group,User
from django.core.exceptions import ObjectDoesNotExist
from django.contrib import messages
import pandas as pd
import os
from django.conf import settings
from django.http import Http404, FileResponse
from django.core.exceptions import ValidationError
from django.utils.text import slugify

def index(request):
    return render(request, 'index.html')

def login(request):
    if request.method == 'POST':
        form = FormLogin(request, data=request.POST)
        if form.is_valid():
            usuario = authenticate(request, username=form.cleaned_data['username'], password=form.cleaned_data['password'])
            if usuario is not None:
                auth_login(request, usuario)
                
                if usuario.groups.filter(name='Alumno').exists():
                    return redirect('alumno_inicio')  
                elif usuario.groups.filter(name='Docente').exists():
                    return redirect('listado_equipamientos')
    else:
        form = FormLogin()
    return render(request, 'inicio_sesion.html', {'form': form})

def registrar(request):
    if request.method == 'POST':
        form = FormRegistrar(request.POST)
        if form.is_valid():
            role = form.cleaned_data['role']
            username = form.cleaned_data['username']
            first_name = form.cleaned_data['first_name']
            last_name = form.cleaned_data['last_name']
            email = form.cleaned_data['email']
            if User.objects.filter(username=username).exists() or \
                User.objects.filter(first_name=first_name, last_name=last_name).exists() or \
                User.objects.filter(email=email).exists():
                messages.error(request, "Ya estás registrado. Por favor, inicia sesión.")
                return redirect('registrar')  
            user = form.save()
            try:
                if role == 'alumno':
                    group = Group.objects.get(name='Alumno')
                elif role == 'docente':
                    group = Group.objects.get(name='Docente')
                else:
                    return redirect('error')  
                group.user_set.add(user) 
                return redirect('login')
            except ObjectDoesNotExist:
                return redirect('error')  
    else:
        form = FormRegistrar()
    return render(request, 'registrarse.html', {'form': form})

def logout_view(request):
    auth_logout(request)
    return redirect('index')



@login_required
def modificacion(request):
    equipos = Equipo.objects.all()
    equipo_seleccionado = None

    if request.method == 'POST':
        equipo_id = request.POST.get('equipo_id')
        
        if equipo_id:
            equipo_seleccionado = get_object_or_404(Equipo, id=equipo_id)
            estado = request.POST.get('estado')
            descripcion = request.POST.get('descripcion')
            lab = request.POST.get('lab')
        
            if estado and descripcion and lab:
                equipo_seleccionado.estado = estado
                equipo_seleccionado.descripcion = descripcion
                equipo_seleccionado.lab = lab
                equipo_seleccionado.save()
                return redirect('listado_equipamientos')  
            
    return render(request, 'modificacion.html', {'equipos': equipos, 'equipo_seleccionado': equipo_seleccionado})

@login_required
def listado_equipamientos(request):
    equipos = Equipo.objects.all()
    return render(request, 'listado_equipamiento.html', {'equipos': equipos})

@login_required
def realizar_prestamo(request, equipo_id):
    equipo = get_object_or_404(Equipo, id=equipo_id, estado='disponible')
    if request.method == 'POST':
        materia = request.POST.get('materia')
        if materia:  
            prestamo = Prestamo(equipo=equipo, alumno=request.user, materia=materia)
            prestamo.save()
            equipo.estado = 'prestado'
            equipo.save()
            return redirect('mis_prestamos')
        else:
            messages.error(request, "Debe seleccionar una materia.")
    return render(request, 'realizar_prestamo.html', {'equipo': equipo})

@login_required
def devolver_prestamo(request, prestamo_id):
    prestamo = get_object_or_404(Prestamo, id=prestamo_id, alumno=request.user)
    if not prestamo.fecha_devolucion:
        prestamo.devolver()
    return redirect('mis_prestamos')

@login_required
def alumno_inicio(request):
    equipos = Equipo.objects.filter(estado='disponible') 
    return render(request, 'alumno_inicio.html', {'equipos': equipos})

    

@login_required
def mis_prestamos(request):
    prestamos = Prestamo.objects.filter(alumno=request.user)  
    return render(request, 'mis_prestamos.html', {'prestamos': prestamos})

@login_required
def listado_prestamos(request):
    
    prestamos = Prestamo.objects.all()

    
    materia = request.GET.get('materia')
    if materia:
        print(f"Filtrando por materia: {materia}")  
        prestamos = prestamos.filter(materia=materia)

    
    prestado = request.GET.get('prestado')
    if prestado == 'true':
        print("Filtrando por préstamos aún no devueltos")  
        prestamos = prestamos.filter(fecha_devolucion__isnull=True)  
    elif prestado == 'false':
        print("Filtrando por préstamos devueltos") 
        prestamos = prestamos.filter(fecha_devolucion__isnull=False)  

    
    print(prestamos)  

    return render(request, 'listado_prestamos.html', {'prestamos': prestamos})

@login_required
def CargaLote(request):
    if request.method == 'POST':
        archivo = request.FILES['archivo']
        try:
            # Intentar leer el archivo Excel
            df = pd.read_excel(archivo)

            # Validación de las columnas del Excel
            required_columns = ['marca', 'nro_serie', 'tipo', 'estado', 'descripcion', 'lab', 'imagen']
            if not all(col in df.columns for col in required_columns):
                missing_cols = [col for col in required_columns if col not in df.columns]
                raise ValidationError(f"Faltan las siguientes columnas: {', '.join(missing_cols)}")

            # Guardar los datos en la base de datos
            for _, row in df.iterrows():
                try:
                    imagen_path = row['imagen']  # Ruta de la imagen
                    imagen = None

                    # Si se proporciona una ruta de imagen, copiarla al directorio 'media/laboratorio/'
                    if imagen_path:
                        # Asegurarnos de que la ruta es válida y luego copiar la imagen
                        imagen_path = imagen_path.strip()
                        if os.path.exists(os.path.join(settings.MEDIA_ROOT, imagen_path.lstrip('/'))):
                            # Crear un nombre único para la imagen si es necesario
                            file_name = slugify(row['nro_serie']) + os.path.splitext(imagen_path)[1]
                            destino = os.path.join(settings.MEDIA_ROOT, 'laboratorio', file_name)
                            
                            # Copiar la imagen al directorio 'media/laboratorio/'
                            with open(os.path.join(settings.MEDIA_ROOT, imagen_path.lstrip('/')), 'rb') as img_file:
                                with open(destino, 'wb') as dest_file:
                                    dest_file.write(img_file.read())
                                
                            # Asignar la imagen al modelo (guardar la ruta relativa)
                            imagen = 'laboratorio/' + file_name
                        else:
                            raise ValidationError(f"Imagen no encontrada en la ruta {imagen_path}")

                    # Crear el objeto equipo con la imagen
                    equipo = Equipo.objects.create(
                        marca=row['marca'],
                        nro_serie=row['nro_serie'],
                        tipo=row['tipo'],
                        estado=row['estado'],
                        descripcion=row['descripcion'],
                        lab=row['lab'],
                        imagen=imagen if imagen else None  # Solo asignamos imagen si existe
                    )

                except Exception as e:
                    # Si ocurre un error al guardar el equipo, mostramos el error específico
                    messages.error(request, f"Error al guardar el equipo con el Nro_Serie {row['nro_serie']}: {str(e)}")
                    return render(request, 'carga.html')

            # Si todo sale bien
            messages.success(request, "Equipos cargados correctamente.")
            return redirect('listado_equipamientos')

        except ValidationError as e:
            # Si falta alguna columna
            messages.error(request, str(e))
            return render(request, 'carga.html')
        except Exception as e:
            # Si ocurre cualquier otro error (por ejemplo, problemas leyendo el archivo)
            messages.error(request, f"Hubo un error al cargar los datos: {str(e)}")
            return render(request, 'carga.html')

    return render(request, 'carga.html')
@login_required
def descargaExcelModelo(request, filename):
    file_path = os.path.join(settings.MEDIA_ROOT, filename)
    
    if os.path.exists(file_path):
        response = FileResponse(open(file_path, 'rb'))
        response['Content-Disposition'] = f'attachment; filename="{filename}"'
        return response
    else:
        raise Http404("File does not exist")    