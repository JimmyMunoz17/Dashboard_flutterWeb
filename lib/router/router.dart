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
  static String dashboardIconsRoute = '/dashboard/icons';
  static String dashboardBlackRoute = '/dashboard/black';
  static String dashboardCategoriesRoute = '/dashboard/categories';
  static String dashboardUsersRoute = '/dashboard/users';
  static String dashboardUserRoute = '/dashboard/users/:uid';

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
    router.define(dashboardIconsRoute,
        handler: DashboardHandlers.icons,
        transitionType: TransitionType.fadeIn);
    router.define(dashboardBlackRoute,
        handler: DashboardHandlers.blackview,
        transitionType: TransitionType.fadeIn);
    router.define(dashboardCategoriesRoute,
        handler: DashboardHandlers.categories,
        transitionType: TransitionType.fadeIn);

    //Rutas Users routes
    router.define(dashboardUsersRoute,
        handler: DashboardHandlers.users,
        transitionType: TransitionType.fadeIn);
    router.define(dashboardUserRoute,
        handler: DashboardHandlers.user, transitionType: TransitionType.fadeIn);

    //Ruta 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
