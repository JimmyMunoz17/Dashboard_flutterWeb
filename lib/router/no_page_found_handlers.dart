import 'package:fluro/fluro.dart';

import '../ui/views/no_page_found_view.dart';

//Administrador de rutas de captura de errores 404 idependiente

class NoPageFoundHandlers {
  //404
  static Handler noPageFound = Handler(handlerFunc: (context, parameters) {
    return const NoPageFoundView();
  });
}
