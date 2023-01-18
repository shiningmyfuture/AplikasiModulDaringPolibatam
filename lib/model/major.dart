import 'dart:convert';

Major majorFromJson(String str) => Major.fromJson(json.decode(str));

String majorToJson(Major data) => json.encode(data.toJson());

class Major {
  Major({
    required this.id_jurusan,
    required this.nama_jurusan,
  });

  String id_jurusan;
  String nama_jurusan;

  factory Major.fromJson(Map<String, dynamic> json) => Major(
        id_jurusan: json["id_jurusan"],
        nama_jurusan: json["nama_jurusan"],
      );

  Map<String, dynamic> toJson() => {
        "id_jurusan": id_jurusan,
        "nama_jurusan": nama_jurusan,
      };
  @override
  String toString() => nama_jurusan;
}
