import 'dart:convert';
import 'dart:ffi';

class PaketTravel {
  int id;
  int id_tujuan;
  Float harga; //benerin yo aku gak yakin soalnya
  int durasi;

  PaketTravel (
    {required this.id,
    required this.id_tujuan,
    required this.harga,
    required this.durasi,
  });

    factory PaketTravel.fromRawJson(String str) => PaketTravel.fromJson(json.decode(str));
    factory PaketTravel.fromJson(Map<String, dynamic> json) => PaketTravel(
      id: json["id"], 
      id_tujuan: json["id_tujuan"], 
      harga: json["harga"], 
      durasi: json["durasi"],
    );

    String toRawJson() => json.encode(toJson());
    Map<String, dynamic> toJson() => {
      "id": id,
      "id_tujuan": id_tujuan,
      "harga": harga,
      "durasi": durasi,
    };
}