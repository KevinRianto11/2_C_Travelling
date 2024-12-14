import 'package:travel/entity/review.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'shared_preference.dart'; 

class ReviewClient {
  static final String url = '10.0.2.2:8000';
  static final String endpoint = '/api/review';

  static Future<List<Review>> fetchAll() async {
    try {
      final token = await SharedPreference().getToken(); 
      if (token == null) throw Exception('Not authenticated');
      var response = await http.get(
        Uri.http(url, endpoint),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token", 
        },
      );

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Iterable list = json.decode(response.body)['data'];

      return list.map((e) => Review.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Review> find(int id) async {
    try {
      final token = await SharedPreference().getToken(); 
      var response = await http.get(
        Uri.http(url, '$endpoint/$id'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token", 
        },
      );

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return Review.fromJson(json.decode(response.body)['data']);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<http.Response> create(Review review) async {
    try {
      final token = await SharedPreference().getToken(); 
      var response = await http.post(
        Uri.http(url, endpoint),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token", 
        },
        body: review.toRawJson(),
      );

      if (response.statusCode != 201) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<http.Response> update(Review review) async {
    try {
      final token = await SharedPreference().getToken(); 
      var response = await http.put(
        Uri.http(url, '$endpoint/${review.id}'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token", 
        },
        body: review.toRawJson(),
      );

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}