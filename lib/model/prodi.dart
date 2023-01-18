// To parse this JSON data, do
//
//     final prodi = prodiFromJson(jsonString);

import 'dart:convert';

Prodi prodiFromJson(String str) => Prodi.fromJson(json.decode(str));

String prodiToJson(Prodi data) => json.encode(data.toJson());

class Prodi {
  Prodi({
    required this.idJurusan,
    required this.idProdi,
    required this.namaProdi,
  });

  String idJurusan;
  String idProdi;
  String namaProdi;

  factory Prodi.fromJson(Map<String, dynamic> json) => Prodi(
        idJurusan: json["id_jurusan"],
        idProdi: json["id_prodi"],
        namaProdi: json["nama_prodi"],
      );

  Map<String, dynamic> toJson() => {
        "id_jurusan": idJurusan,
        "id_prodi": idProdi,
        "nama_prodi": namaProdi,
      };
}
