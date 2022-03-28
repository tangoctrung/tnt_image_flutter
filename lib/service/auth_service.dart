import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:socialtnt/model/user.dart';

class AuthService {
  static String URL_API = 'http://localhost:8000/api';
  static var client = http.Client();

  static register ({required username, email, password}) async {
    var res = await client.post(
      Uri.parse('$URL_API/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String> {'username': username, 'email': email, 'password': password})
    );

    if (res.statusCode == 200 || res.statusCode == 201) {
      var stringObject = res.body;
      var user = userFromJson(stringObject);
      return user;
    }
  }

  static login ({required  email, password}) async {
    var res = await client.post(
      Uri.parse('$URL_API/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String> {'email': email, 'password': password})
    );

    if (res.statusCode == 200 || res.statusCode == 201) {
      var stringObject = res.body;
      var user = userFromJson(stringObject);
      return user;
    }
  }


}