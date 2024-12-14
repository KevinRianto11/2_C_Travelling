import 'package:travel/entity/pembayaran.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:travel/client/shared_preference.dart';

class PembayaranClient {
  static const String url = '10.0.2.2:8000';
  static const String endpoint = '/api/pembayaran';
  static final _prefs = SharedPreference();

  static Future<List<Pembayaran>> fetchAll() async {
    try {
      final token = await _prefs.getToken();
      if (token == null) throw Exception('Not authenticated');
      final response = await get(Uri.http(url, endpoint));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          final List<dynamic> data = responseData['data'];
          return data.map((e) => Pembayaran.fromJson(e)).toList();
        } else {
          throw Exception(responseData['message']);
        }
      }
      throw Exception('Failed to fetch data: ${response.reasonPhrase}');
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Pembayaran> find(String id) async {
    try {
      final response = await get(Uri.http(url, '$endpoint/$id'));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          return Pembayaran.fromJson(responseData['data']);
        } else {
          throw Exception(responseData['message']);
        }
      } else if (response.statusCode == 404) {
        throw Exception('Pembayaran not found');
      }
      throw Exception('Failed to fetch data: ${response.reasonPhrase}');
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Pembayaran> create(Map<String, dynamic> pembayaranData) async {
    try {
      final response = await post(
        Uri.http(url, endpoint),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'metode_pembayaran': pembayaranData['metode_pembayaran'],
          'status_pembayaran': pembayaranData['status_pembayaran'],
        }),
      );

      final responseData = json.decode(response.body);
      
      if (response.statusCode == 201) {
        if (responseData['status'] == true) {
          return Pembayaran.fromJson(responseData['data']);
        }
      } else if (response.statusCode == 422) {
        throw Exception('Validation error: ${responseData['data']}');
      } else if (response.statusCode == 404) {
        throw Exception('No active pemesanan found');
      }
      
      throw Exception(responseData['message'] ?? 'Failed to create pembayaran');
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Pembayaran> update(String id, Map<String, dynamic> pembayaranData) async {
    try {
      final response = await put(
        Uri.http(url, '$endpoint/$id'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(pembayaranData),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['status'] == true) {
          return Pembayaran.fromJson(responseData['data']);
        }
      } else if (response.statusCode == 422) {
        final responseData = json.decode(response.body);
        throw Exception('Validation error: ${responseData['data']}');
      } else if (response.statusCode == 404) {
        throw Exception('Pembayaran not found');
      }
      
      throw Exception('Failed to update pembayaran');
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<void> destroy(String id) async {
    try {
      final response = await delete(Uri.http(url, '$endpoint/$id'));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['status'] != true) {
          throw Exception(responseData['message']);
        }
        return;
      } else if (response.statusCode == 404) {
        throw Exception('Pembayaran not found');
      }
      
      throw Exception('Failed to delete pembayaran');
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}