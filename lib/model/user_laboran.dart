// To parse this JSON data, do
//
//     final laboran = laboranFromJson(jsonString);

import 'dart:convert';

Laboran laboranFromJson(String str) => Laboran.fromJson(json.decode(str));

String laboranToJson(Laboran data) => json.encode(data.toJson());

class Laboran {
    Laboran({
      required  this.idLaboran,
      required  this.username,
      required  this.password,
      required  this.nikLaboran,
      required  this.noHplaboran,
      required  this.emailLaboran,
      required  this.alamatLaboran,
    });

    String idLaboran;
    String username;
    String password;
    String nikLaboran;
    String noHplaboran;
    String emailLaboran;
    String alamatLaboran;

    factory Laboran.fromJson(Map<String, dynamic> json) => Laboran(
        idLaboran: json["id_laboran"],
        username: json["username"],
        password: json["password"],
        nikLaboran: json["nik_laboran"],
        noHplaboran: json["no_hplaboran"],
        emailLaboran: json["email_laboran"],
        alamatLaboran: json["alamat_laboran"],
    );

    Map<String, dynamic> toJson() => {
        "id_laboran": idLaboran,
        "username": username,
        "password": password,
        "nik_laboran": nikLaboran,
        "no_hplaboran": noHplaboran,
        "email_laboran": emailLaboran,
        "alamat_laboran": alamatLaboran,
    };
}
