import 'package:flutter/material.dart';

import 'package:dashboard_admin/api/cafe_api.dart';

import 'package:dashboard_admin/models/http/users_response.dart';

import 'package:dashboard_admin/models/usuario.dart';

class UsersProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = true;
  //Variable para ordenar asendente los valores de la tabla
  bool ascending = true;
  //da la información de que columna se selecciona
  int sortColumnIndex = 0;

  //Apenas inicie se llama el constructor y se obtienen los usuarios
  UsersProvider() {
    getPaginateUsers();
  }

  getPaginateUsers() async {
    final response = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResponse = UsersResponse.fromMap(response);
    users = [...usersResponse.usuarios];
    isLoading = false;
    notifyListeners();
  }

  //Regresa el id
  Future<Usuario?> getUserById(String uid) async {
    try {
      final response = await CafeApi.httpGet('/usuarios/$uid');
      final user = Usuario.fromMap(response);
      return user;
    } catch (e) {
      return null;
    }
  }

  //Organizar la tabal <T> --> significa generica cualquier tipo de elemento
  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    //Reorganiza la lista de usuarios método Sort
    users.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      //verificación asendente o desendente
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    ascending = !ascending;
    notifyListeners();
  }

  //Caragar los cambio ralizados en el ususario
  void refreshUser(Usuario newUser) {
    users = users.map((user) {
      if (user.uid == newUser.uid) {
        user = newUser;
      }
      return user;
    }).toList();
    notifyListeners();
  }
}
