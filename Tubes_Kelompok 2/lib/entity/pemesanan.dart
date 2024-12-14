import 'dart:convert';

class Pemesanan {
  final int id;
  final int id_paket;
  final int id_pengguna;
  final int id_driver;
  final int id_tujuan;
  DateTime tanggal_pemesanan;
  String status_pemesanan;
  final String title;
  final int price;
  final int seats;

  Pemesanan(
      {required this.id,
      required this.id_paket,
      required this.id_pengguna,
      required this.id_driver,
      required this.id_tujuan,
      required this.tanggal_pemesanan,
      required this.status_pemesanan,
      required this.title,
      required this.price,
      required this.seats,
      });

  factory Pemesanan.fromRawJson(String str) =>
      Pemesanan.fromJson(json.decode(str));
  factory Pemesanan.fromJson(Map<String, dynamic> json) => Pemesanan(
        id: json["id"],
        id_paket: json["id_paket"],
        id_pengguna: json["id_pengguna"],
        id_driver: json["id_driver"],
        id_tujuan: json["id_tujuan"],
        tanggal_pemesanan: DateTime.parse(
            json["tanggal_pemesanan"]), // Memastikan format DateTime
        status_pemesanan: json["status_pemesanan"],
        title: json["title"],
        price: json["price"],
        seats: json["seats"],
      );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
        "id": id,
        "id_paket": id_paket,
        "id_pengguna": id_pengguna,
        "id_driver": id_driver,
        "id_tujuan": id_tujuan,
        "tanggal_pemesanan": tanggal_pemesanan
            .toIso8601String(), // Mengonversi ke format ISO 8601
        "status_pemesanan": status_pemesanan,
      };
}
