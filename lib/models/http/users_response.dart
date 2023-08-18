// To parse this JSON data, do
//
//     final usersResponse = usersResponseFromMap(jsonString);

import 'dart:convert';

import '../usuario.dart';

class UsersResponse {
  final int total;
  final List<Usuario> usuarios;

  UsersResponse({
    required this.total,
    required this.usuarios,
  });

  factory UsersResponse.fromJson(String str) =>
      UsersResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsersResponse.fromMap(Map<String, dynamic> json) => UsersResponse(
        total: json["total"],
        usuarios:
            List<Usuario>.from(json["usuarios"].map((x) => Usuario.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toMap())),
      };
}
