import 'dart:convert';
import 'package:github_users_flutter/domain/repository_modal.dart';
import 'package:http/http.dart' as http;

class RepositoryNetworking {
  static const String urlApi = 'https://api.github.com';

  static Future<List<Repository>> searchRepos(username) async {
    var url = '$urlApi/users/$username/repos';

    var respository;
    var header = {"Content-Type": "application/json"};

    var response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      var bodyJson = json.decode(response.body);

      return (bodyJson as List)
          .map((e) =>
              e == null ? null : Repository.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}
