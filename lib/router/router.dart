import 'package:fluro/fluro.dart';

import 'package:dashboard_admin/router/admin_handlers.dart';
import 'package:dashboard_admin/router/dashboard_handlers.dart';

import 'no_page_found_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  //Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  //Dashboard
  static String dashboardRoute = '/dashboard';

  static void configureRoute() {
    //Ruta inicial /
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.fadeIn);
    // Ruta auth routes
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.fadeIn);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.fadeIn);

    //Ruta Dashboard routes
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);
    //Ruta 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
