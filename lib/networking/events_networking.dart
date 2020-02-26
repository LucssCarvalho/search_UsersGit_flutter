import 'dart:convert';
import 'package:github_users_flutter/domain/event_modal.dart';
import 'package:http/http.dart' as http;

class EventsNetworking {
  static const String urlApi = 'https://api.github.com';

  static Future<List<Event>> searchEvent(String username) async {
    var url = '$urlApi/users/$username/events';

    var header = {"Content-Type": "application/json"};

    var response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      var bodyJson = json.decode(response.body);

      return (bodyJson as List)
          .map((e) =>
              e == null ? null : Event.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}
