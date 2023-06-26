import 'package:dashboard_admin/providers/auth_provider.dart';
import 'package:dashboard_admin/ui/views/dashboard_view.dart';
import 'package:fluro/fluro.dart';

import 'package:dashboard_admin/ui/views/login_view.dart';
import 'package:dashboard_admin/ui/views/register_view.dart';
import 'package:provider/provider.dart';

//Administrador de los Handlers Auth
class AdminHandlers {
  //login
  static Handler login = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      //si no esta autenticado muestra el login
      return const LoginView();
    } else {
      //si esta autenticado muestra el dashboard
      return const DashboardView();
    }
  });
  //Register
  static Handler register = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      //si no esta autenticado muestra el register
      return const RegisterView();
    } else {
      //si esta autenticado muestra el dashboard
      return const DashboardView();
    }
  });
  //Dashboard
}
