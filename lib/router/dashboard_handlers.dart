import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:dashboard_admin/providers/providers.dart';

import 'package:dashboard_admin/ui/views/views.dart';

import 'package:dashboard_admin/router/router.dart';

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

  //Categories view

  static Handler categories = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    //Encargada de seleccionar la opción en el menú
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardCategoriesRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const CategoriesView();
    } else {
      return const LoginView();
    }
  });

  //Users view

  static Handler users = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardUsersRoute);
    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const UsersView();
    } else {
      return const LoginView();
    }
  });

  //User view

  static Handler user = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardUserRoute);
    if (authProvider.authStatus == AuthStatus.authenticated) {
      if (parameters['uid']?.first != null) {
        return UserView(uid: parameters['uid']!.first);
      }
    } else {
      return const LoginView();
    }
    return null;
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
