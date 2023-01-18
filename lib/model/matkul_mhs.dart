// To parse this JSON data, do
//
//     final matkulMhs = matkulMhsFromJson(jsonString);

import 'dart:convert';

MatkulMhs matkulMhsFromJson(String str) => MatkulMhs.fromJson(json.decode(str));

String matkulMhsToJson(MatkulMhs data) => json.encode(data.toJson());

class MatkulMhs {
  MatkulMhs({
    required this.idMatkul,
    required this.idMhs,
  });

  String idMatkul;
  String idMhs;

  factory MatkulMhs.fromJson(Map<String, dynamic> json) => MatkulMhs(
        idMatkul: json["id_matkul"],
        idMhs: json["id_mhs"],
      );

  Map<String, dynamic> toJson() => {
        "id_matkul": idMatkul,
        "id_mhs": idMhs,
      };
}
