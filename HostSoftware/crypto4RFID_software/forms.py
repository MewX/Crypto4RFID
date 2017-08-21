
from django import forms
from django.template.context_processors import request

class TestForm(forms.Form):
    host = forms.CharField(label="Host Address")
    mode = forms.CharField(label="Modes")
        
        