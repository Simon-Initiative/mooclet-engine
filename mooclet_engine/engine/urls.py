from django.urls import re_path, include
from rest_framework import routers
from . import views

router = routers.DefaultRouter(trailing_slash=False)
router.register(r'mooclet', views.MoocletViewSet)
router.register(r'version', views.VersionViewSet)
router.register(r'variable', views.VariableViewSet)
router.register(r'value', views.ValueViewSet)
#router.register(r'valuepandas', views.PandasValueViewSet)
router.register(r'policy', views.PolicyViewSet)
router.register(r'learner', views.LearnerViewSet)
# router.register(r'user', views.UserViewSet)
router.register(r'policyparameters', views.PolicyParametersViewSet)
router.register(r'policyparametershistory', views.PolicyParametersHistoryViewSet)

#for using name instead of pk
router.register(r'version-name', views.VersionNameViewSet)
app_name = 'engine'
urlpatterns = [
	re_path(r'^api/v1/', include((router.urls, app_name), namespace='v1')),
	re_path(r'^data', views.PandasValueViewSet.as_view()),
	re_path(r'^learner-data', views.PandasLearnerValueViewSet.as_view()),
	# re_path(r'^api/getBinaryContextualImputer/', views.getBinaryContextualImputer.as_view()),
	re_path(r'^api/initContext/', views.ContextualImputer.as_view()),
	re_path(r'^api/dataDownload/', views.ExportExcelValues.as_view()),
]
