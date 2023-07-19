import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import 'package:dashboard_admin/providers/sidemenu_provider.dart';

import 'package:dashboard_admin/router/router.dart';

import '../ui/views/dashboard_view.dart';
import '../ui/views/login_view.dart';
import 'package:dashboard_admin/ui/views/black_view.dart';
import 'package:dashboard_admin/ui/views/icons_view.dart';

//Administrador de los Handlers Dashboard
class DashboardHandlers {
  //Dashboard
  static Handler dashboard = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    //Encargada de seleccionar la opción en el menú
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

    //si esta autenticado muestra el dashboard
    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const DashboardView();
    } else {
      //si no esta autenticado muestra el login
      return const LoginView();
    }
  });

  //Dashboard Icons
  static Handler icons = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    //Encargada de seleccionar la opción en el menú
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardIconsRoute);

    //si esta autenticado muestra el dashboard
    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const IconsView();
    } else {
      //si no esta autenticado muestra el login
      return const LoginView();
    }
  });

  //Black view

  static Handler blackview = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    //Encargada de seleccionar la opción en el menú
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardBlackRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const BlackView();
    } else {
      return const LoginView();
    }
  });
}
