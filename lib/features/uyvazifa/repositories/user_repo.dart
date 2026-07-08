import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class UserRepository {
  final String baseUrl = 'https://68a9cff5b115e67576ec277d.mockapi.io/users';

  Future<List<UserModel>> getUsers() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data.map((e) => UserModel.fromJson(e)).toList();
    }

    throw Exception('Users yuklanmadi');
  }

  Future<void> createUser(UserModel user) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('User yaratilmadi');
    }
  }

  Future<void> deleteUser(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('User o\'chirilmadi');
    }
  }

  Future<void> updateUser(UserModel user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${user.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('User yangilanmadi');
    }
  }
}
