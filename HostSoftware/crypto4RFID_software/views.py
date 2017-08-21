# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render, render_to_response
from crypto4RFID_software.forms import ConfigForm
from django.http.response import HttpResponseRedirect

def main_page(request):
    return render_to_response('config_reader.html',{})

def config_form(request):
    if request.method == 'POST':
        form = ConfigForm(request.POST)
        if form.is_valid():
            return HttpResponseRedirect('/thanks/')
    else :
        form = ConfigForm()
    return render(request, 'config_reader.html', {'form': form})
    
def config_request(request):
    print request.POST['host']
    print request.POST['port']
    print request.POST['time']
    print request.POST['power']
    print request.POST['modulation']
    print request.POST['population']
    
    return render_to_response('inventory.html',{})
        