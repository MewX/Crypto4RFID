
from django import forms

class ConfigForm(forms.Form):
    host = forms.CharField(label='', widget=forms.TextInput(attrs={'class' : 'inputFieldClass', 'placeholder' : 'Host address'}))
    port = forms.CharField(label='', widget=forms.TextInput(attrs={'class' : 'inputFieldClass', 'placeholder' : 'Port'}))
    time = forms.CharField(label='', widget=forms.TextInput(attrs={'class' : 'inputFieldClass', 'placeholder' : 'Time'}))
    power = forms.CharField(label='', widget=forms.TextInput(attrs={'class' : 'inputFieldClass', 'placeholder' : 'Transmit power (default 0=max power)'}))
    modulation = forms.CharField(label='', widget=forms.TextInput(attrs={'class' : 'inputFieldClass', 'placeholder' : 'Modulation (default M8)'}))
    population = forms.CharField(label='', widget=forms.TextInput(attrs={'class' : 'inputFieldClass', 'placeholder' : 'Tag population value (default 4)'}))

