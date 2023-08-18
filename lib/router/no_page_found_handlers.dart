import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:dashboard_admin/providers/sidemenu_provider.dart';
import '../ui/views/no_page_found_view.dart';

//Administrador de rutas de captura de errores 404 idependiente
class NoPageFoundHandlers {
  //404
  static Handler noPageFound = Handler(handlerFunc: (context, parameters) {
    Provider.of<SideMenuProvider>(context!, listen: false)
        .setCurrentPageUrl('/404');

    return const NoPageFoundView();
  });
}
