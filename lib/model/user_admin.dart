// To parse this JSON data, do
//
//     final admin = adminFromJson(jsonString);

import 'dart:convert';

Admin adminFromJson(String str) => Admin.fromJson(json.decode(str));

String adminToJson(Admin data) => json.encode(data.toJson());

class Admin {
  Admin({
    required this.idAdmin,
    required this.username,
    required this.password,
    required this.noHpadmin,
    required this.emailAdmin,
    required this.alamatAdmin,
  });

  String idAdmin;
  String username;
  String password;
  String noHpadmin;
  String emailAdmin;
  String alamatAdmin;

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        idAdmin: json["id_admin"],
        username: json["username"],
        password: json["password"],
        noHpadmin: json["no_hpadmin"],
        emailAdmin: json["email_admin"],
        alamatAdmin: json["alamat_admin"],
      );

  Map<String, dynamic> toJson() => {
        "id_admin": idAdmin,
        "username": username,
        "password": password,
        "no_hpadmin": noHpadmin,
        "email_admin": emailAdmin,
        "alamat_admin": alamatAdmin,
      };
}
