import 'package:travel/entity/driver.dart';
import 'package:travel/client/shared_preference.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class DriverClient {
  static const String url = '10.0.2.2:8000';
  static const String endpoint = '/api/driver';
  static final _prefs = SharedPreference();

  static Future<List<Driver>> fetchAll() async {
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
      return list.map((e) => Driver.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Driver> find(int id) async {
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

      return Driver.fromJson(responseData['data']);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}