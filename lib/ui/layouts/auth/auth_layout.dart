import 'package:flutter/material.dart';

import 'package:dashboard_admin/ui/layouts/auth/widgets/custom_background_page.dart';
import 'package:dashboard_admin/ui/layouts/auth/widgets/custom_links_bar.dart';
import 'package:dashboard_admin/ui/layouts/auth/widgets/custom_title.dart';

class AuthLayout extends StatelessWidget {
  //Variable que envía la vista a renderizar por medio del hijo login o register
  final Widget child;
  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          //Desktop and Mobile
          (size.width > 900)
              ? _DesktopBody(
                  child: child,
                )
              : _MobileBody(
                  child: child,
                ),

          //Lisks bar
          const CustomLinksBar()
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  //Renderiza la vista enviada
  final Widget child;
  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Se debe establecer el tamaño por que esta en el ListView
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height * 0.95,
      child: Stack(
        children: [
          //Background
          const CustomBackgroundPage(),
          //view container
          Center(
            child: SizedBox(
              width: 850,
              height: 650,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          color: const Color.fromRGBO(45, 45, 45, 1),
                          child: Image.asset(
                            'img/sign_in.png',
                            width: double.infinity,
                            height: double.infinity,
                          ))),
                  Container(
                    color: const Color.fromRGBO(30, 30, 30, 1),
                    width: 450,
                    height: double.infinity,
                    child: Column(
                      children: [
                        const CustomTitle(),
                        const SizedBox(
                          height: 20,
                        ),
                        //Vista a renderizar esta en el child
                        Expanded(child: child),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  //Renderiza la vista enviada
  final Widget child;
  const _MobileBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Se debe establecer el tamaño por que esta en el ListView
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        height: size.height * 0.95,
        child: Stack(
          children: [
            const CustomBackgroundPage(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                //Title
                const CustomTitle(),
                //Vista a renderizar esta en el child
                SizedBox(width: double.infinity, height: 485, child: child),
                Expanded(
                    flex: 1,
                    child: Image.asset(
                      'img/sign_in.png',
                      width: double.infinity,
                      height: double.infinity,
                    )),
              ],
            ),
          ],
        ));
  }
}
