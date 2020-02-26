import 'dart:convert';
import 'package:github_users_flutter/domain/repository_modal.dart';
import 'package:http/http.dart' as http;

import '../domain/company_modal.dart';
import '../domain/company_modal.dart';

class CompanyNetworking {
  static const String urlApi = 'https://api.github.com';

  static Future<Company> searchCompany(String company) async {
    var url = '$urlApi/orgs/$company';

    var header = {"Content-Type": "application/json"};

    var response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      Map bodyJson = json.decode(response.body);

      return Company.fromJson(bodyJson);
    } else {
      return null;
    }
  }
}
