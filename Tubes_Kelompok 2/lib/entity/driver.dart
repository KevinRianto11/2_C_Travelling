import 'dart:convert';

class Driver {
  int id;
  String nama_driver;
  String merk_kendaraan;
  String nomor_kendaraan;
  String no_telp;
  String? foto_driver;


  Driver (
    {required this.id,
    required this.nama_driver,
    required this.merk_kendaraan,
    required this.nomor_kendaraan,
    required this.no_telp,
    this.foto_driver});

    factory Driver.fromRawJson(String str) => Driver.fromJson(json.decode(str));
    factory Driver.fromJson(Map<String, dynamic> json) => Driver(
      id: json["id"], 
      nama_driver: json["nama_driver"], 
      merk_kendaraan: json["merk_kendaraan"], 
      nomor_kendaraan: json["nomor_kendaraan"],
      no_telp: json["no_telp"],
      foto_driver: json["foto_driver"],
    );

    String toRawJson() => json.encode(toJson());
    Map<String, dynamic> toJson() => {
      "id": id,
      "nama_driver": nama_driver,
      "merk_kendaraan": merk_kendaraan,
      "nomor_kendaraan": nomor_kendaraan,
      "no_telp": no_telp,
      "foto_driver": foto_driver,
    };
}