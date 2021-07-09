import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  Future<bool> isLogged() async {
    var localStorage = await SharedPreferences.getInstance();
    return localStorage.getString('access_token') != null;
  }

  Future<String> getToken() async {
    var localStorage = await SharedPreferences.getInstance();
    if (localStorage.getString('access_token') != null)
      return jsonDecode(
          localStorage.getString('access_token')!)['access_token'];
    else
      throw ('Token does not exist.');
  }

  Future<bool> loginAndReturnIsSuccessful(
      String username, String password) async {
    if (!RegExp(r'^[0-9a-zA-Z]*$').hasMatch(username) ||
        !RegExp(r'^[0-9a-zA-Z]*$').hasMatch(password)) return false;

    var data = {
      "grant_type": "password",
      "client_id": "1",
      "client_secret": dotenv.env['CLIENT_SECRET'],
      "username": username,
      "password": password,
      "scope": "*"
    };

    var fullUrl = Uri.parse(dotenv.env['URL']! + '/oauth/token');
    var res = await http.post(fullUrl, body: jsonEncode(data), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
    var body = json.decode(res.body);

    if (body['access_token'] == null)
      return false;
    else {
      var localStorage = await SharedPreferences.getInstance();
      localStorage.setString('access_token', json.encode(body['access_token']));
      localStorage.setString(
          'refresh_token', json.encode(body['refresh_token']));
      return true;
    }
  }

  logout() async {
    var localStorage = await SharedPreferences.getInstance();
    localStorage.remove('access_token');
    localStorage.remove('refresh_token');
  }
}
