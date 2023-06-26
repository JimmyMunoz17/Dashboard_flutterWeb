import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../ui/views/dashboard_view.dart';
import '../ui/views/login_view.dart';

//Administrador de los Handlers Dashboard
class DashboardHandlers {
  //Dashboard
  static Handler dashboard = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    //si esta autenticado muestra el dashboard
    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const DashboardView();
    } else {
      //si no esta autenticado muestra el login
      return const LoginView();
    }
  });
}
