// To parse this JSON data, do
//
//     final dosen = dosenFromJson(jsonString);

import 'dart:convert';

Dosen dosenFromJson(String str) => Dosen.fromJson(json.decode(str));

String dosenToJson(Dosen data) => json.encode(data.toJson());

class Dosen {
    Dosen({
      required  this.idDosen,
      required  this.username,
      required  this.password,
      required  this.nikDosen,
      required  this.noHpdosen,
      required  this.emailDosen,
      required  this.alamatDosen,
    });

    String idDosen;
    String username;
    String password;
    String nikDosen;
    String noHpdosen;
    String emailDosen;
    String alamatDosen;

    factory Dosen.fromJson(Map<String, dynamic> json) => Dosen(
        idDosen: json["id_dosen"],
        username: json["username"],
        password: json["password"],
        nikDosen: json["nik_dosen"],
        noHpdosen: json["no_hpdosen"],
        emailDosen: json["email_dosen"],
        alamatDosen: json["alamat_dosen"],
    );

    Map<String, dynamic> toJson() => {
        "id_dosen": idDosen,
        "username": username,
        "password": password,
        "nik_dosen": nikDosen,
        "no_hpdosen": noHpdosen,
        "email_dosen": emailDosen,
        "alamat_dosen": alamatDosen,
    };
}
