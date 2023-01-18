// To parse this JSON data, do
//
//     final jurusan = jurusanFromJson(jsonString);

import 'dart:convert';

List<Jurusan> jurusanFromJson(String str) => List<Jurusan>.from(json.decode(str).map((x) => Jurusan.fromJson(x)));

String jurusanToJson(List<Jurusan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Jurusan {
    Jurusan({
      required  this.idJurusan,
      required  this.namaJurusan,
    });

    String idJurusan;
    String namaJurusan;

    factory Jurusan.fromJson(Map<String, dynamic> json) => Jurusan(
        idJurusan: json["id_jurusan"],
        namaJurusan: json["nama_jurusan"],
    );

    Map<String, dynamic> toJson() => {
        "id_jurusan": idJurusan,
        "nama_jurusan": namaJurusan,
    };
}
