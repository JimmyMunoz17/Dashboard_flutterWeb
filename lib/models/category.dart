import 'dart:convert';

class Category {
  final String id;
  String nombre;
  final Usuario usuario;

  Category({
    required this.id,
    required this.nombre,
    required this.usuario,
  });

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["_id"],
        nombre: json["nombre"],
        usuario: Usuario.fromMap(json["usuario"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
        "usuario": usuario.toMap(),
      };

  @override
  String toString() {
    return 'Categoria: $nombre';
  }
}

class Usuario {
  final String id;
  final String nombre;

  Usuario({
    required this.id,
    required this.nombre,
  });

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        id: json["_id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
      };
}
