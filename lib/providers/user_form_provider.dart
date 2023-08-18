import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:dashboard_admin/api/cafe_api.dart';

import 'package:dashboard_admin/models/usuario.dart';

class UserFormProvider extends ChangeNotifier {
  //Actualización del usuario
  Usuario? user;
  late GlobalKey<FormState> formkey;

  //actulización del nombre del usaurio en la imagen
  // void updateListener() {
  //   notifyListeners();
  // }

  //Crea una nueva copia para actulizar cualquier elemento del usuario
  copyUserWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    user = Usuario(
        rol: rol ?? user!.rol,
        estado: estado ?? user!.estado,
        google: google ?? user!.google,
        nombre: nombre ?? user!.nombre,
        correo: correo ?? user!.correo,
        uid: uid ?? user!.uid);
    notifyListeners();
  }

  bool _validForm() {
    return formkey.currentState!.validate();
  }

  Future updateUser() async {
    if (!_validForm()) return false;

    final data = {'nombre': user!.nombre, 'correo': user!.correo};

    try {
      // ignore: unused_local_variable
      final response = await CafeApi.httpPut('/usuarios/${user!.uid}', data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Usuario> uploadImage(String path, Uint8List bytes) async {
    try {
      final response = await CafeApi.httpUploadPut(path, bytes);
      user = Usuario.fromMap(response);
      notifyListeners();
      return user!;
    } catch (e) {
      throw 'Error en el user from provider';
    }
  }
}
