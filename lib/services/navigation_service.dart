import 'package:flutter/material.dart';

class NavigationService {
  //COntrolador de la navegación
  static GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

  //Obtine la ruta de navegación
  static navigateTo(String routeName) {
    return navigatorkey.currentState!.pushNamed(routeName);
  }

  //Remplaza la ruta de navegación
  static replaceTo(String routeName) {
    return navigatorkey.currentState!.pushReplacementNamed(routeName);
  }
}
