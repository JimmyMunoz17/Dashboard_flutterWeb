import 'package:flutter/material.dart';

class SideMenuProvider extends ChangeNotifier {
  static late AnimationController menuController;
  static bool isMenuOpen = false;

  //Página actual
  String _currentPage = '';

  void setCurrentPageUrl(String routeName) {
    _currentPage = routeName;
    //Espera hasta que se cree el widget y actuliza la página
    Future.delayed(const Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }

  String get currentPage {
    print(_currentPage);
    return _currentPage;
  }

  //Animación de apertura menú
  static Animation<double> movement = Tween<double>(begin: -200, end: 0)
      .animate(
          CurvedAnimation(parent: menuController, curve: Curves.easeInOut));
  // Animación de cierre menú
  static Animation<double> opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: menuController, curve: Curves.easeInOut));
  //inicio animación de apertura
  static void openMenu() {
    isMenuOpen = true;
    menuController.forward();
  }

  // cierre de la Animación
  static void closeMenu() {
    isMenuOpen = false;
    menuController.reverse();
  }

  //Si esta abierto que lo cierre y si esta cerrado que se abra el menú
  static void toggleMenu() {
    (isMenuOpen) ? menuController.reverse() : menuController.forward();
    isMenuOpen = !isMenuOpen;
  }
}
