import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/providers.dart';

import 'package:dashboard_admin/router/router.dart';
import 'package:dashboard_admin/services/local_storage.dart';
import 'package:dashboard_admin/services/navigation_service.dart';
import 'package:dashboard_admin/services/notifications_service.dart';

import 'package:dashboard_admin/ui/layouts/auth/auth_layout.dart';
import 'package:dashboard_admin/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:dashboard_admin/ui/layouts/splash/splash_layout.dart';

import 'package:dashboard_admin/api/cafe_api.dart';

Future<void> main() async {
  // await dotenv.load(fileName: '.env');
  //configuración del localStorage necesario que sea de tipo async y await
  await LocalStorage.configurePrefs();
  //configuración de la API
  CafeApi.configureDio();
  //Configuración del Route
  Flurorouter.configureRoute();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideMenuProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (_) => UsersProvider()),
        ChangeNotifierProvider(create: (_) => UserFormProvider())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard Admin | Jimmy Muñoz',
      //Configuración del Route
      initialRoute: Flurorouter.rootRoute,
      onGenerateRoute: Flurorouter.router.generator,
      //Controlador de Navegación
      navigatorKey: NavigationService.navigatorkey,
      //configuración del snackbar
      scaffoldMessengerKey: NotificationsService.messengerKey,

      //Configuración del Layout inicial solo recibe widgets
      builder: (_, child) {
        // print(LocalStorage.prefs.getString('token'));//acceso al token
        final authProvider = Provider.of<AuthProvider>(context);
        //Autenticación revisando
        if (authProvider.authStatus == AuthStatus.checking) {
          return const SplashLayout();
        }
        //Autenticación autorizada
        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          //Autenticación no autorizada
          return AuthLayout(child: child!);
        }
      },
    );
  }
}
