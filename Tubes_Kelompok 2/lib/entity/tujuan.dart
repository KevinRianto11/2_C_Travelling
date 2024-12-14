import 'dart:convert';

class Tujuan {
  int id;
  String nama_tujuan;
  String lokasi;
  String deskripsi;
  String? foto_wisata;

  Tujuan (
    {required this.id,
    required this.nama_tujuan,
    required this.lokasi,
    required this.deskripsi,
    this.foto_wisata,
  });

    factory Tujuan.fromRawJson(String str) => Tujuan.fromJson(json.decode(str));
    factory Tujuan.fromJson(Map<String, dynamic> json) => Tujuan(
      id: json["id"], 
      nama_tujuan: json["nama_tujuan"], 
      lokasi: json["lokasi"], 
      deskripsi: json["deskripsi"],
      foto_wisata: json["foto_wisata"]
    );

    String toRawJson() => json.encode(toJson());
    Map<String, dynamic> toJson() => {
      "id": id,
      "nama_tujuan": nama_tujuan,
      "lokasi": lokasi,
      "deskripsi": deskripsi,
      "foto_wisata": foto_wisata,
    };
}