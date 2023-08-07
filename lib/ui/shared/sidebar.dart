import 'package:dashboard_admin/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dashboard_admin/router/router.dart';
import 'package:dashboard_admin/services/navigation_service.dart';
import 'package:dashboard_admin/ui/shared/widget/logo.dart';
import 'package:dashboard_admin/ui/shared/widget/menu_item.dart';
import 'package:dashboard_admin/ui/shared/widget/text_separator.dart';
import 'package:dashboard_admin/providers/sidemenu_provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  //Función de Navegación rutas
  void navigationTo(String routeName) {
    //Navegación a la ruta con Navegation Service y Navigatorkey
    NavigationService.navigateTo(routeName);
    //llamada del cierre del menú
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    //instancia del side Menu Provider
    final sideMenuProvider =
        Provider.of<SideMenuProvider>(context, listen: false);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: boxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(
            height: 10,
          ),
          const TextSeparator(text: 'main'),
          MenuItem(
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            onPressed: () => navigationTo(Flurorouter.dashboardRoute),
            isActive:
                sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
          ),
          MenuItem(
              text: 'Orders',
              icon: Icons.shopping_bag_outlined,
              isActive: false,
              onPressed: () {}),
          MenuItem(
              text: 'Analytic',
              icon: Icons.show_chart_outlined,
              isActive: false,
              onPressed: () {}),
          MenuItem(
              text: 'Categories',
              icon: Icons.layers_clear_outlined,
              isActive: false,
              onPressed: () {}),
          MenuItem(
              text: 'Products',
              icon: Icons.dashboard_outlined,
              isActive: false,
              onPressed: () {}),
          MenuItem(
              text: 'Discount',
              icon: Icons.attach_money_outlined,
              isActive: false,
              onPressed: () {}),
          MenuItem(
              text: 'Custumers',
              icon: Icons.people_alt_outlined,
              isActive: false,
              onPressed: () {}),
          const SizedBox(
            height: 10,
          ),
          const TextSeparator(text: 'UI Elements'),
          MenuItem(
              text: 'Icons',
              icon: Icons.list_alt_outlined,
              onPressed: () => navigationTo(Flurorouter.dashboardIconsRoute),
              isActive: sideMenuProvider.currentPage ==
                  Flurorouter.dashboardIconsRoute),
          MenuItem(
              text: 'Marketing',
              icon: Icons.mark_email_read_outlined,
              isActive: false,
              onPressed: () {}),
          MenuItem(
              text: 'Campaing',
              icon: Icons.note_add_outlined,
              isActive: false,
              onPressed: () {}),
          MenuItem(
            text: 'Black',
            icon: Icons.exit_to_app_outlined,
            onPressed: () => navigationTo(Flurorouter.dashboardBlackRoute),
            isActive:
                sideMenuProvider.currentPage == Flurorouter.dashboardBlackRoute,
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey.shade50,
          ),
          MenuItem(
              text: 'Logout',
              icon: Icons.logout_outlined,
              isActive: false,
              onPressed: () =>
                  Provider.of<AuthProvider>(context, listen: false).logout()),
        ],
      ),
    );
  }

  BoxDecoration boxDecoration() => const BoxDecoration(
      color: Color.fromRGBO(30, 30, 30, 1),
      boxShadow: [BoxShadow(color: Colors.white24, blurRadius: 5)]);
}
