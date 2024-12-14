import 'package:travel/entity/pemesanan.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PemesananClient {
  static const String url = '10.0.2.2:8000';
  static const String endpoint = '/api/pemesanan';
  
  static Map<String, String> authentikasi(String? token) {
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  static Future<List<Pemesanan>> fetchAll(String token) async {
    try {
      final response = await http.get(
        Uri.http(url, endpoint),
        headers: authentikasi(token)
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          final List<dynamic> data = responseData['data'];
          return data.map((json) => Pemesanan.fromJson(json)).toList();
        }
      }
      throw Exception(json.decode(response.body)['message'] ?? 'Failed to fetch pemesanan');
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Pemesanan> find(String token, int id) async {
    try {
      final response = await http.get(
        Uri.http(url, '$endpoint/$id'),
        headers: authentikasi(token)
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          return Pemesanan.fromJson(responseData['data']);
        }
      }
      
      throw Exception(json.decode(response.body)['message'] ?? 'Failed to find pemesanan');
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Pemesanan> create(String token, Pemesanan pemesanan) async {
    try {
      final response = await http.post(
        Uri.http(url, endpoint),
        headers: authentikasi(token),
        body: json.encode(pemesanan.toJson())
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          return Pemesanan.fromJson(responseData['data']);
        }
      }
      
      throw Exception(json.decode(response.body)['message'] ?? 'Failed to create pemesanan');
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Pemesanan> update(String token, Pemesanan pemesanan) async {
    try {
      final response = await http.put(
        Uri.http(url, '$endpoint/${pemesanan.id}'),
        headers: authentikasi(token),
        body: json.encode(pemesanan.toJson())
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          return Pemesanan.fromJson(responseData['data']);
        }
      }
      
      throw Exception(json.decode(response.body)['message'] ?? 'Failed to update pemesanan');
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Pemesanan> destroy(String token, int id) async {
    try {
      final response = await http.delete(
        Uri.http(url, '$endpoint/$id'),
        headers: authentikasi(token)
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          return Pemesanan.fromJson(responseData['data']);
        }
      }
      
      throw Exception(json.decode(response.body)['message'] ?? 'Failed to delete pemesanan');
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Pemesanan> getDetailPemesanan(String token, int id) async {
    try {
      final response = await http.get(
        Uri.http(url, '$endpoint/detail/$id'),
        headers: authentikasi(token)
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          return Pemesanan.fromJson(responseData['data']);
        }
      }
      
      throw Exception(json.decode(response.body)['message'] ?? 'Failed to get pemesanan detail');
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}