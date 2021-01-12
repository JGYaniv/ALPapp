import 'package:http/http.dart' as http;
import 'dart:convert';


class APIService {
  static final String endPoint = "https://alpappapi.herokuapp.com/graphql";

  coldStart() {}

  call({String commands}) async {
    var response = await http.post(
      endPoint,
      body: commands,
      headers: {"Content-Type": "application/json"},
    );

    Map<String, dynamic> _map = jsonDecode(response.body);

    return _map["data"];
  }
}
