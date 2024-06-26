import 'package:flutter_api_series/model/user.dart';
import 'package:flutter_api_series/model/username.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Userapi {
  static Future<List<User>> fetchUser() async {
    print('Hello');
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;

    final users = results.map((e) {
      final name = Username(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );

      return User(
        gender: e['gender'],
        email: e['email'],
        nat: e['nat'],
        phone: e['phone'],
        cell: e['cell'],
        name: name,
      );
    }).toList();
    return users;
  }
}
