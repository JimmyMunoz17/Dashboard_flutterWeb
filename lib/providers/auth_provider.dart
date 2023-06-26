import 'package:dashboard_admin/router/router.dart';
import 'package:dashboard_admin/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:dashboard_admin/services/local_storage.dart';

//Estado de la autenticación
enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    //Todo completar petición HTTP
    _token = 'envioTokenEjemplo';
    LocalStorage.prefs.setString('token', _token!);

    //Navegación al dashboard
    authStatus = AuthStatus.authenticated;
    notifyListeners(); // redibujar
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  //Validación del token autenticación
  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    //TODO: COMPROBACIÓN DEL JWT VÁLIDO

    Future.delayed(const Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
