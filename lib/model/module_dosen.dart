// To parse this JSON data, do
//
//     final moduleModel = moduleModelFromJson(jsonString);

import 'dart:convert';

ModuleModel moduleModelFromJson(String str) => ModuleModel.fromJson(json.decode(str));

String moduleModelToJson(ModuleModel data) => json.encode(data.toJson());

class ModuleModel {
    ModuleModel({
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

    factory ModuleModel.fromJson(Map<String, dynamic> json) => ModuleModel(
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
