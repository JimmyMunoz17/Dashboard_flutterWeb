// To parse this JSON data, do
//
//     final categoriesResponse = categoriesResponseFromMap(jsonString);
//https://quicktype.io/ --origen
import 'dart:convert';

import 'package:dashboard_admin/models/category.dart';

class CategoriesResponse {
  final int total;
  final List<Category> categorias;

  CategoriesResponse({
    required this.total,
    required this.categorias,
  });

  factory CategoriesResponse.fromJson(String str) =>
      CategoriesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriesResponse.fromMap(Map<String, dynamic> json) =>
      CategoriesResponse(
        total: json["total"],
        categorias: List<Category>.from(
            json["categorias"].map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "categorias": List<dynamic>.from(categorias.map((x) => x.toMap())),
      };
}
