import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel/entity/pengguna.dart';
import 'shared_preference.dart';

class PenggunaServiceClient {
  static const String baseUrl = 'http://10.0.2.2:8000/api'; 

  static const String indexEndpoint = '/pengguna';
  static const String registerEndpoint = '/register';
  static const String loginEndpoint = '/login';
  static const String logoutEndpoint = '/logout';
  static const String updateEndpoint = '/pengguna/update'; 
  static const String deleteEndpoint = '/pengguna/delete'; 
  static const String showEndpoint = '/pengguna/show'; 
  static const String updateProfileEndpoint = '/pengguna/update-profile-picture';
  static const String deleteProfileEndpoint = '/pengguna/delete-profile-picture';
  static const String getProfilePictureEndpoint = '/pengguna/getprofilepicture';


  static final SharedPreference _prefsManager = SharedPreference();

  static Future<Map<String, dynamic>> register({
    required String nama_pengguna,
    required String email,
    required String password,
    required String noTelp,
  }) async {
    var uri = Uri.parse('$baseUrl$registerEndpoint');
    var request = http.MultipartRequest('POST', uri);

    request.fields['nama_pengguna'] = nama_pengguna; 
    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['no_telp'] = noTelp;

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 201) {
      return json.decode(response.body);
    }
    throw Exception('Registration failed: ${response.body}');
  }

  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl$loginEndpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      await _prefsManager.saveToken(responseData['token']);
      await _prefsManager.saveUserId(responseData['detail']['id']);
      return responseData;
    }
    throw Exception('Login failed: ${response.body}');
  }

  static Future<Map<String, dynamic>> update({
    required String id,
    required String token,
    required String nama_pengguna,
    required String email,
    required String noTelp,
    String? password, 
  }) async {
    var uri = Uri.parse('$baseUrl$updateEndpoint/$id');
    var request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = 'Bearer $token';

    if (noTelp.length < 12) {
      throw Exception('Nomor telepon minimal 12 digit');
    }

    request.fields['nama_pengguna'] = nama_pengguna;
    request.fields['email'] = email; 
    request.fields['no_telp'] = noTelp;

    if (password != null && password.isNotEmpty) {
      if (password.length < 6) {
        throw Exception('Password minimal 6 karakter');
      }
      request.fields['password'] = password;
    }

     try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 403) {
        throw Exception('Unauthorized: Tidak dapat mengubah data pengguna lain');
      } else if (response.statusCode == 400) {
        var responseData = json.decode(response.body);
        if (responseData['message'] == 'Password baru tidak boleh sama dengan password lama') {
          throw Exception(responseData['message']);
        }
        throw Exception('Update failed: ${responseData['message']}');
      }
      throw Exception('Update failed: ${response.body}');
    } catch (e) {
      throw Exception('Error during update: $e');
    }
  }

  static Future<Map<String, dynamic>> updateProfilePicture({
    required String id,
    required String token,
    required List<int> imageBytes,
    required String fileName,
}) async {
    var uri = Uri.parse('$baseUrl$updateProfileEndpoint/$id');
    var request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Accept'] = 'application/json';

    request.files.add(
        http.MultipartFile.fromBytes(
            'profile_picture',
            imageBytes,
            filename: fileName,
        ),
    );

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
        return json.decode(response.body);
    } else if (response.statusCode == 403) {
        throw Exception('Unauthorized: Tidak dapat mengubah foto profil pengguna lain');
    }
    throw Exception('Update profile picture failed: ${response.body}');
  }

  static Future<Map<String, dynamic>> delete({
    required String id,
    required String token,
  }) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$deleteEndpoint/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    throw Exception('Delete failed: ${response.body}');
  }

  static Future<Map<String, dynamic>> logout() async {
    String? token = await _prefsManager.getToken(); 
    if (token == null) {
      throw Exception('Token is missing');
    }

    final response = await http.post(
      Uri.parse('$baseUrl$logoutEndpoint'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      await _prefsManager.clear();
      return json.decode(response.body);
    }
    throw Exception('Logout failed: ${response.body}');
  }

  static Future<Pengguna> getUser ({
    required String id,
    required String token,
    String? profile_picture,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl$showEndpoint/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['status'] == true && responseData['data'] != null) {
        return Pengguna.fromJson(responseData['data']);
      }
      throw Exception(responseData['message'] ?? 'Failed to fetch user details');
    }
    throw Exception('Failed to load user: ${response.body}');
  }

  static Future<Map<String, dynamic>> getProfilePicture({
  required String id,
  required String token,
}) async {
    var uri = Uri.parse('$baseUrl$getProfilePictureEndpoint/$id');
    var request = http.Request('GET', uri);
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Accept'] = 'application/json';

    var response = await request.send();

    if (response.statusCode == 200) {
      return json.decode(await response.stream.bytesToString());
    } else if (response.statusCode == 403) {
      throw Exception('Unauthorized: You cannot access another user\'s profile picture');
    }
    throw Exception('Failed to get profile picture: ${await response.stream.bytesToString()}');
  }

  static Future<Map<String, dynamic>> deleteProfilePicture({
    required String id,
    required String token,
  }) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$deleteProfileEndpoint/$id'), 
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 403) {
      throw Exception('Unauthorized: You cannot delete another user\'s profile picture');
    }
    throw Exception('Delete profile picture failed: ${response.body}');
  }
}