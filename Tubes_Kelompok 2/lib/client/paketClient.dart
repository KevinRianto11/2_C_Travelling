import 'package:travel/entity/paketTravel.dart';
import 'package:travel/client/shared_preference.dart';

import 'dart:convert';
import 'package:http/http.dart';

class PaketTravekTravekTravekClient {
  static final String url = '10.0.2.2:8000';
  static final String endpoint = '/api/paketTravel';
  static final _prefs = SharedPreference();

  static Future<List<PaketTravel>> fetchAll() async {
    try{
      final token = await _prefs.getToken();
      if (token == null) throw Exception('Not authenticated');
      var response = await get(Uri.http(url, endpoint));

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Iterable list = json.decode(response.body)['data'];

      return list.map((e) => PaketTravel.fromJson(e)).toList();
    }catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<PaketTravel> find(id) async {
    try{
      var response = await get(Uri.http(url, '$endpoint/$id'));

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return PaketTravel.fromJson(json.decode(response.body)['data']);
    }catch (e) {
      return Future.error(e.toString());
    }
  }

}