import 'dart:convert';

class Review {
  int id;
  int id_pengguna;
  int id_pemesanan;
  int id_driver;
  int rating;
  String? komentar; 
  DateTime tanggal_review;

  Review({
    required this.id,
    required this.id_pengguna,
    required this.id_pemesanan,
    required this.id_driver,
    required this.rating,
    this.komentar, 
    required this.tanggal_review,
  });

  factory Review.fromRawJson(String str) => Review.fromJson(json.decode(str));
  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        id_pengguna: json["id_pengguna"],
        id_pemesanan: json["id_pemesanan"],
        id_driver: json["id_driver"],
        rating: json["rating"],
        komentar: json["komentar"], 
        tanggal_review: DateTime.parse(json["tanggal_review"]),
      );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
        "id": id,
        "id_pengguna": id_pengguna,
        "id_pemesanan": id_pemesanan,
        "id_driver": id_driver,
        "rating": rating,
        "komentar": komentar, 
        "tanggal_review": tanggal_review.toIso8601String(),
      };
}