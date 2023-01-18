// To parse this JSON data, do
//
//     final pdfModel = pdfModelFromJson(jsonString);

import 'dart:convert';

PdfModel pdfModelFromJson(String str) => PdfModel.fromJson(json.decode(str));

String pdfModelToJson(PdfModel data) => json.encode(data.toJson());

class PdfModel {
    PdfModel({
        required this.idModul,
        required this.idMatkul,
        required this.jenisModul,
        required this.judulModul,
        required this.modulFile,
        required this.modulLink,
        required this.icon,
    });

    String idModul;
    String idMatkul;
    String jenisModul;
    String judulModul;
    String modulFile;
    String modulLink;
    String icon;

    factory PdfModel.fromJson(Map<String, dynamic> json) => PdfModel(
        idModul: json["id_modul"],
        idMatkul: json["id_matkul"],
        jenisModul: json["jenis_modul"],
        judulModul: json["judul_modul"],
        modulFile: json["modul_file"],
        modulLink: json["modul_link"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id_modul": idModul,
        "id_matkul": idMatkul,
        "jenis_modul": jenisModul,
        "judul_modul": judulModul,
        "modul_file": modulFile,
        "modul_link": modulLink,
        "icon": icon,
    };
}
