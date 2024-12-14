import 'dart:convert';

class Pembayaran {
  int id;
  int id_pemesanan;
  DateTime tanggal_pembayaran;
  String metode_pembayaran;
  String status_pembayaran;
  String? logoPembayaran;
  String total_pembayaran;

  Pembayaran (
    {required this.id,
    required this.id_pemesanan,
    required this.tanggal_pembayaran,
    required this.metode_pembayaran,
    required this.status_pembayaran,
    required this.total_pembayaran,
    this.logoPembayaran,
  });

    factory Pembayaran.fromRawJson(String str) => Pembayaran.fromJson(json.decode(str));
    factory Pembayaran.fromJson(Map<String, dynamic> json) => Pembayaran(
      id: json["id"], 
      id_pemesanan: json["id_pemesanan"], 
      tanggal_pembayaran: json["tanggal_pembayaran"], 
      metode_pembayaran: json["metode_pembayaran"],
      logoPembayaran: json["logo_pembayaran"],
      status_pembayaran: json["status_pembayaran"],
      total_pembayaran: json["total_pembayaran"],
    );

    String toRawJson() => json.encode(toJson());
    Map<String, dynamic> toJson() => {
      "id": id,
      "id_pemesanan": id_pemesanan,
      "tanggal_pembayaran": tanggal_pembayaran,
      "metode_pembayaran": metode_pembayaran,
      "logo_pembayaran": logoPembayaran,
      "status_pembayaran": status_pembayaran,
      "total_pembayaran": total_pembayaran,
    };
}