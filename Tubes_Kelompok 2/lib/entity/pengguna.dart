import 'dart:convert';

class Pengguna {
  int id;
  String nama_pengguna;
  String email;
  String password;
  String no_telp;
  String? profile_picture; 

  Pengguna({
    required this.id,
    required this.nama_pengguna,
    required this.email,
    required this.password,
    required this.no_telp,
    this.profile_picture, 
  });

  factory Pengguna.fromRawJson(String str) => Pengguna.fromJson(json.decode(str));
  
  factory Pengguna.fromJson(Map<String, dynamic> json) => Pengguna(
        id: json["id"],
        nama_pengguna: json["nama_pengguna"], 
        email: json["email"], 
        password: json["password"],
        no_telp: json["no_telp"],
        profile_picture: json["profile_picture"], 
      );

  String toRawJson() => json.encode(toJson());
  
  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_pengguna": nama_pengguna,
        "email": email,
        "password": password,
        "no_telp": no_telp,
        "profile_picture": profile_picture, 
      };
}