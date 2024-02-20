// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? usuario;
  String? clave;

  User({
    this.usuario,
    this.clave,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    usuario: json["usuario"],
    clave: json["clave"],
  );

  Map<String, dynamic> toJson() => {
    "usuario": usuario,
    "clave": clave,
  };
}