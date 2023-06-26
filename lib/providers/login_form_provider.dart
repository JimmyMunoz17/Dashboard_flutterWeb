import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  //Llavero de manejador de estados
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String emailLogin = "";
  String passwordLogin = "";

  bool validatorLogin() => formKey.currentState!.validate() ? true : false;
}
