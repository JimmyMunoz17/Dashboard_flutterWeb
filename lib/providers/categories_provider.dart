import 'package:flutter/material.dart';

import 'package:dashboard_admin/api/cafe_api.dart';

import 'package:dashboard_admin/models/http/categories_response.dart';
import 'package:dashboard_admin/models/category.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Category> categorias = [];

  getCategories() async {
    final response = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromMap(response);
    categorias = [...categoriesResponse.categorias];
    notifyListeners();
  }

//Creación de nueva categoría
  Future newCategory(String name) async {
    final data = {'nombre': name};
    try {
      final json = await CafeApi.httpPost('/categorias', data);
      final newCategory = Category.fromMap(json);
      categorias.add(newCategory);
      notifyListeners();
    } catch (e) {
      throw 'Error creación categoría';
    }
  }

  //Actulización de la categoría
  Future updateCategory(String id, String name) async {
    final data = {'nombre': name};
    try {
      await CafeApi.httpPut('/categorias/$id', data);
      categorias = categorias.map((c) {
        if (c.id != id) return c;
        c.nombre = name;
        return c;
      }).toList();
      notifyListeners();
    } catch (e) {
      throw 'Error actulización';
    }
  }

  //Eliminar Categoría
  Future deleteCategory(String id) async {
    try {
      await CafeApi.httpDelete('/categorias/$id', {});
      categorias.removeWhere((categoria) => categoria.id == id);
      notifyListeners();
    } catch (e) {
      throw 'Error Eliminar';
    }
  }
}
