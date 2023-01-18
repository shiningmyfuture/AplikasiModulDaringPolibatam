// To parse this JSON data, do
//
//     final mataKuliah = mataKuliahFromJson(jsonString);

import 'dart:convert';

MataKuliah mataKuliahFromJson(String str) => MataKuliah.fromJson(json.decode(str));

String mataKuliahToJson(MataKuliah data) => json.encode(data.toJson());

class MataKuliah {
    MataKuliah({
      required this.idMatkul,
      required this.kodeMatkul,
      required this.namaMatkul,
      required this.idProdi,
    });

    String idMatkul;
    String kodeMatkul;
    String namaMatkul;
    String idProdi;

    factory MataKuliah.fromJson(Map<String, dynamic> json) => MataKuliah(
        idMatkul: json["id_matkul"],
        kodeMatkul: json["kode_matkul"],
        namaMatkul: json["nama_matkul"],
        idProdi: json["id_prodi"],
    );

    Map<String, dynamic> toJson() => {
        "id_matkul": idMatkul,
        "kode_matkul": kodeMatkul,
        "nama_matkul": namaMatkul,
        "id_prodi": idProdi,
    };
}


