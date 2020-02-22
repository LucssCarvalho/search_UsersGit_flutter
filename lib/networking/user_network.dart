import 'dart:convert';
import 'package:github_users_flutter/domain/user_modal.dart';
import 'package:http/http.dart' as http;

class UserNetworking {
  static const String urlApi = 'https://api.github.com';

  static Future<User> searchUser(username) async {
    var url = '$urlApi/users/$username';

    var header = {"Content-Type": "application/json"};

    var response = await http.get(url, headers: header);
    Map bodyJson = json.decode(response.body);
    if (response.statusCode == 200) {
      return User.fromJson(bodyJson);
    }
    return null;
  }
}
