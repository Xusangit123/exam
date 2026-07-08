import 'dart:convert';

import 'package:firebase/features/auth_post/models/auth_post_models.dart';
import 'package:http/http.dart' as http;

class AuthPostRepo {
  static const String apiUrl = 'https://api-service.fintechhub.uz/register/';
  Future<List<AuthPostModels>> authpost() async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': 'John',
        'email': 'john.doe@example.com',
        'phone': '+998901234567',
        'fullname': 'John Doe',
        'birthYear': '1990',
        'region': 'Tashkent',
        'password': 'password123',
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List data = jsonDecode(response.body);

      return data.map((e) => AuthPostModels.fromJson(e)).toList();
    }

    throw Exception('Users yuklanmadi');
  }
}
