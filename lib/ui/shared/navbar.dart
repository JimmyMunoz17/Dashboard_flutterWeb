import 'package:dashboard_admin/providers/sidemenu_provider.dart';
import 'package:flutter/material.dart';

import 'package:dashboard_admin/ui/shared/widget/navbar_avatar.dart';
import 'package:dashboard_admin/ui/shared/widget/notification_indicator.dart';
import 'package:dashboard_admin/ui/shared/widget/search_text.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          if (size.width <= 750)
            //Menú hamburguesa
            IconButton(
                onPressed: () => SideMenuProvider.openMenu(),
                icon: const Icon(
                  Icons.menu_outlined,
                  color: Colors.white,
                )),
          const SizedBox(
            width: 5,
          ),
          //Todo: search input
          if (size.width > 380)
            ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 250),
                child: const SearchText()),
          const Spacer(),
          const NotificationsIndicator(),
          const SizedBox(
            width: 10,
          ),
          const NavbarAvatar(),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
      color: Color.fromRGBO(45, 45, 45, 1),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}
