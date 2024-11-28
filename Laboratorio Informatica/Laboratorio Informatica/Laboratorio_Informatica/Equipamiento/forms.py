from django import forms
from .models import Equipo,Prestamo
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.models import User

class FormEquipo(forms.ModelForm):
    class Meta:
        model = Equipo
        fields = ['marca', 'nro_serie', 'tipo', 'estado', 'descripcion', 'lab', 'imagen']
        widgets = {
            'descripcion': forms.Textarea(attrs={'rows': 4, 'cols': 40}),
        }

class FormRegistrar(UserCreationForm):
    ROLE_CHOICES = [
        ('alumno', 'Alumno'),
        ('docente', 'Docente'),
    ]
    role = forms.ChoiceField(choices=ROLE_CHOICES, label='Rol')
    
    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'password1', 'password2', 'role']

class FormLogin(AuthenticationForm):
    username = forms.CharField(label='Username', max_length=100)
    password = forms.CharField(label='Password', widget=forms.PasswordInput)

class FormPrestamo(forms.Form):
    materia = forms.ChoiceField(
        choices=Prestamo.MATERIA_CHOICES,
        widget=forms.Select(attrs={'class': 'form-control'}),
        label="Materia",)
