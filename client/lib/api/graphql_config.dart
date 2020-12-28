import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  final String url = "https://alpappapi.herokuapp.com/graphql";

  getGQL({String body}) async {
    var response = await http.post(
      url,
      body: body,
      headers: {"Content-Type": "application/json"},
    );

    Map<String, dynamic> _map = jsonDecode(response.body);

    return _map["data"];
  }
}
