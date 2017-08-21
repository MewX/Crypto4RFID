# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.http import request
from django.http.response import HttpResponse, HttpResponseNotFound,\
    HttpResponseRedirect
from django.shortcuts import render, render_to_response
from django.template import Context
from crypto4RFID_software.forms import TestForm
from django.views.generic.edit import FormView

def main_page(request):
    return render_to_response('config_reader.html',{})

def get_name(request):
    if request.method == 'POST':
        form = TestForm(request.POST)
        if form.is_valid():
            return HttpResponseRedirect('/thanks/')
    else :
        form = TestForm()
    return render(request, 'config_reader.html', {'form': form})
    
def config_request(request):
    print 'test!!'
    print request.POST['host']
    print request.POST['mode']
    return render_to_response('inventory.html',{})
        