import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  //Llavero de manejador de estados
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String nameRegister = "";
  String emailRegister = "";
  String passwordRegister = "";

  bool validatorRegistro() => formKey.currentState!.validate() ? true : false;
}
