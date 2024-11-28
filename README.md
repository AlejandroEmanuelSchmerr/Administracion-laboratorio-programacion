
# **Sistema de Administración de Laboratorio de Programación**

Este es un proyecto desarrollado para administrar un laboratorio de programación en una secundaria. Permite gestionar equipos, horarios y recursos del laboratorio, proporcionando una herramienta práctica y funcional para los responsables.

## **Tecnologías utilizadas**
- **Backend**: Python, Django  
- **Frontend**: HTML, CSS  
- **Base de datos**: MySQL  
- **Entorno de desarrollo**: XAMPP  

---

## **Características**
### Página principal (Inicio)
- Menú de navegación con las opciones:
  - **Inicio**: Regresa a la página principal.
  - **Iniciar sesión**: Permite acceder al sistema como alumno o profesor.
  - **Información**: Detalles sobre el laboratorio.
  - **Especialidades**: Descripción de las 4 especialidades del colegio.
  - **Contacto**: Información de contacto (WhatsApp, email, Facebook, Instagram).
- Imagen destacada del laboratorio informático.
- Información de las especialidades con sus nombres y descripciones.
- Mapa de ubicación del colegio.
- Sección de contacto con las redes sociales y correo del colegio.

### Inicio de sesión y registro
- **Inicio de sesión**: Acceso al sistema con usuario y contraseña.
- **Registro**: Posibilidad de registrarse como alumno o profesor.

### Funcionalidades según el tipo de usuario
#### Alumno
- Ver equipos disponibles para préstamo.
- Solicitar préstamo seleccionando la materia.
- Consultar y gestionar los préstamos realizados:
  - Ver detalles de los préstamos con fecha de préstamo y devolución.
  - Devolver equipos prestados (registro con marca de tiempo).

#### Profesor
- Listado general de equipamientos registrados por el administrador.
- Visualización de préstamos históricos:
  - Filtrar por materia, estado, o ambos.
  - Información detallada de préstamos: alumno, equipo, estado, y materia.
- Modificar equipos:
  - Seleccionar equipo y actualizar su estado, descripción, o laboratorio.
- **Carga masiva de equipos**:
  - Opción disponible en el menú de navegación.
  - Permite descargar un modelo de Excel con el formato requerido para la carga.
  - Una vez completado, el archivo se puede subir al sistema para registrar múltiples equipos de forma simultánea.
  - El sistema valida los datos y registra los equipos en la base de datos.

#### Administrador
- Gestión de usuarios (creación, edición, eliminación).
- Gestión de equipamientos (carga, edición, eliminación).
- Acceso total a la base de datos para mantener la integridad del sistema.

*Nota: El proyecto está casi terminado, pero aún faltan algunos detalles por implementar.*

---

## **Requisitos para ejecutar el proyecto**
1. **Python** (versión 3.8 o superior).  
2. **Django** (instalado en el entorno Python).  
3. **XAMPP** (para gestionar la base de datos MySQL).  
4. Archivo de base de datos: `bd_laboratorio.sql`.  

---

## **Pasos de instalación y ejecución**

### **1. Instalar Python**
- Descarga e instala Python desde [python.org](https://www.python.org/).
- Durante la instalación, selecciona "Add Python to PATH".
- Verifica la instalación ejecutando:
  ```bash
  python --version
  ```

### **2. Instalar Django**
- Abre la terminal y ejecuta:
  ```bash
  pip install django
  ```

### **3. Instalar XAMPP**
- Descarga e instala XAMPP desde [apachefriends.org](https://www.apachefriends.org/).
- Inicia el módulo **MySQL** desde el panel de control de XAMPP.

### **4. Configurar la base de datos**
- Importa el archivo `bd_laboratorio.sql` en phpMyAdmin:
  1. Abre phpMyAdmin desde XAMPP (generalmente en `http://localhost/phpmyadmin`).
  2. Crea una base de datos llamada `bd_laboratorio`.
  3. Importa el archivo `bd_laboratorio.sql`.

### **5. Configurar y ejecutar el proyecto**
1. Descarga el proyecto desde este repositorio y extrae el contenido.
2. Abre una terminal en la carpeta del proyecto.
3. Asegúrate de que las dependencias estén instaladas (Django y otros).
4. Realiza las migraciones de Django:
   ```bash
   python manage.py makemigrations
   python manage.py migrate
   ```
5. Inicia el servidor:
   ```bash
   python manage.py runserver
   ```
6. Accede al proyecto desde tu navegador en: `http://127.0.0.1:8000/`.

---

## **Estado del proyecto**
El proyecto está casi terminado, pero aún faltan algunos ajustes y funcionalidades por implementar.

---

## **Autor**
- **Nombre**: Emanuel Schmer  
- **Correo**: emanuelschmer@gmail.com  

---

## **Agradecimientos**
Gracias por tomarte el tiempo de ver este proyecto. 😊
