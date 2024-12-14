import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel/entity/tujuan.dart';
import 'package:travel/client/shared_preference.dart';

class TujuanClient {
  static const String url = '10.0.2.2:8000';
  static const String endpoint = '/api/tujuan';
  static final _prefs = SharedPreference();

  static Future<List<Tujuan>> fetchAll() async {
    try {
      final token = await _prefs.getToken();
      if (token == null) throw Exception('Not authenticated');

      final response = await http.get(
        Uri.http(url, endpoint),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      final responseData = json.decode(response.body);
      if (responseData['status'] != true) {
        throw Exception(responseData['message']);
      }

      Iterable list = responseData['data'];
      return list.map((e) => Tujuan.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Tujuan> find(int id) async {
    try {
      final token = await _prefs.getToken();
      if (token == null) throw Exception('Not authenticated');

      final response = await http.get(
        Uri.http(url, '$endpoint/$id'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      final responseData = json.decode(response.body);
      if (responseData['status'] != true) {
        throw Exception(responseData['message']);
      }

      return Tujuan.fromJson(responseData['data']);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}