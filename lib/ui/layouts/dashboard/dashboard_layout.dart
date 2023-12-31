import 'package:flutter/material.dart';

import 'package:dashboard_admin/providers/sidemenu_provider.dart';

import '../../shared/sidebar.dart';
import 'package:dashboard_admin/ui/shared/navbar.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;

  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SideMenuProvider.menuController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
      body: Stack(
        children: [
          Row(
            children: [
              //Menú lateral
              if (size.width >= 700) const Sidebar(),
              Expanded(
                child: Column(
                  children: [
                    const Navbar(),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: widget.child),
                    )
                  ],
                ),
              )
            ],
          ),
          //Menú lateral
          if (size.width < 700)
            AnimatedBuilder(
                animation: SideMenuProvider.menuController,
                builder: (context, _) => Stack(
                      children: [
                        //Todo: background
                        if (SideMenuProvider.isMenuOpen)
                          Opacity(
                            opacity: SideMenuProvider.opacity.value,
                            child: GestureDetector(
                              onTap: () => SideMenuProvider.closeMenu(),
                              child: Container(
                                width: size.width,
                                height: size.height,
                                color: Colors.black26,
                              ),
                            ),
                          ),

                        Transform.translate(
                          offset: Offset(SideMenuProvider.movement.value, 0),
                          child: const Sidebar(),
                        )
                      ],
                    )),
        ],
      ),
    );
  }
}
