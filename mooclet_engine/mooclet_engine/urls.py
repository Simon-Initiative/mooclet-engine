from django.urls import re_path, include
from django.contrib import admin
from . import views

urlpatterns = [
	re_path(r'^engine/', include('engine.urls', namespace="engine")),
	re_path(r'^admin/', admin.site.urls),
    re_path(r'^$', views.home, name='home'),
]
