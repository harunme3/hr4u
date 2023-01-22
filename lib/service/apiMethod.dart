
import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiMethods {
  static post(String url, Map<String, String> body) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final jsonBody = jsonEncode(body);
    var response =
    await http.post(Uri.parse(url), headers: headers, body: jsonBody);
    return response;
  }

  static get(String url) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    var response = await http.get(Uri.parse(url), headers: headers);
    return response;
  }
}
