from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import UsuarioViewSet, InteraccionViewSet, RegistroUsuarioView, CustomTokenObtainPairView
from rest_framework_simplejwt.views import TokenRefreshView

# Autenticación social con Google
from dj_rest_auth.registration.views import SocialLoginView
from allauth.socialaccount.providers.google.views import GoogleOAuth2Adapter

class GoogleLogin(SocialLoginView):
    adapter_class = GoogleOAuth2Adapter

# Definir las rutas de la API con DRF
router = DefaultRouter()
router.register(r'usuarios', UsuarioViewSet)
router.register(r'interacciones', InteraccionViewSet)

urlpatterns = [
    # Autenticación con usuario y JWT
    path('token/', CustomTokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    
    # Registro de usuarios
    path('registro/', RegistroUsuarioView.as_view(), name='registro_usuario'),

    # Rutas del API REST con DRF
    path('', include(router.urls)),

    # Autenticación normal con JWT
    path('auth/', include('dj_rest_auth.urls')),  
    
    # Registro de usuarios normal
    path('auth/registration/', include('dj_rest_auth.registration.urls')),  
    
    # Login con Google
    path('auth/google/', GoogleLogin.as_view(), name='google_login'),

    # Social Auth con Django
    path('auth/social/', include('social_django.urls', namespace='social')),
]
