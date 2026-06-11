import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/config/api_config.dart';
import '../core/services/storage_service.dart';

class AuthController {

  Future<dynamic> login(String email, String password) async {

    final response = await http.post(
      Uri.parse("${ApiConfig.baseUrl}/auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password
      }),
    );

    final data = jsonDecode(response.body);

    if (data["token"] != null) {
      await StorageService.saveToken(data["token"]);
    }

    return data;
  }
}