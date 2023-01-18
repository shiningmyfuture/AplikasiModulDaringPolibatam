// To parse this JSON data, do
//
//     final mahasiswa = mahasiswaFromJson(jsonString);

import 'dart:convert';

Mahasiswa mahasiswaFromJson(String str) => Mahasiswa.fromJson(json.decode(str));

String mahasiswaToJson(Mahasiswa data) => json.encode(data.toJson());

class Mahasiswa {
    Mahasiswa({
        required this.idMhs,
        required this.username,
        required this.password,
        required this.nimMhs,
        required this.noHpmhs,
        required this.emailMhs,
        required this.alamatMhs,
    });

    String idMhs;
    String username;
    String password;
    String nimMhs;
    String noHpmhs;
    String emailMhs;
    String alamatMhs;

    factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        idMhs: json["id_mhs"],
        username: json["username"],
        password: json["password"],
        nimMhs: json["nim_mhs"],
        noHpmhs: json["no_hpmhs"],
        emailMhs: json["email_mhs"],
        alamatMhs: json["alamat_mhs"],
    );

    Map<String, dynamic> toJson() => {
        "id_mhs": idMhs,
        "username": username,
        "password": password,
        "nim_mhs": nimMhs,
        "no_hpmhs": noHpmhs,
        "email_mhs": emailMhs,
        "alamat_mhs": alamatMhs,
    };
}
