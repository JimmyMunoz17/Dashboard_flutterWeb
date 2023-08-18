import 'package:flutter/material.dart';
import 'package:dashboard_admin/router/router.dart';

import 'package:dashboard_admin/api/cafe_api.dart';
import 'package:dashboard_admin/models/http/auth_response.dart';
import 'package:dashboard_admin/models/usuario.dart';

import 'package:dashboard_admin/services/local_storage.dart';
import 'package:dashboard_admin/services/navigation_service.dart';
import 'package:dashboard_admin/services/notifications_service.dart';

//Estado de la autenticación
enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    final data = {'correo': email, 'password': password};
    //conexión con la API
    CafeApi.httpPost('/auth/login', data).then((json) {
      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;
      //Autenticación de login y navegación dashboard
      //Navegación al dashboard si esta autenticado
      authStatus = AuthStatus.authenticated;
      //Revisión del token
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      //configuración API Y solo usen ese JWT
      CafeApi.configureDio();
      notifyListeners(); // redibujar
    }).catchError((e) {
      NotificationsService.showSnackbarError('Credenciales invalidas');
    });
  }

  //Validación del token autenticación
  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    //COMPROBACIÓN DEL JWT VÁLIDO
    try {
      final response = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(response);
      //Validación de un token por 2 semanas de conexión
      LocalStorage.prefs.setString('token', authResponse.token);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      //si no esta autenticado
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  register(String email, String password, String name) {
    //envío de la información map
    final data = {
      'nombre': name,
      'correo': email,
      'password': password,
    };
    //conexión con la API
    CafeApi.httpPost('/usuarios', data).then((json) {
      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;
      //Navegación al dashboard y autenticación de registro
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      NotificationsService.showSnackbarOk('Registro satisfactorio');
      //configuración API Y solo usen ese JWT
      CafeApi.configureDio();
      notifyListeners(); // redibujar
    }).catchError((e) {
      NotificationsService.showSnackbarError('Credenciales invalidas');
    });
  }

  //logout
  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
