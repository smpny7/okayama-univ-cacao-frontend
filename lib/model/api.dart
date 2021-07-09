import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String _url = 'http://192.168.11.12:8000';
  // final String _url = 'http://192.168.11.11:8000';
  // final String _url = 'http://10.6.27.95:8000';

  //if you are using android studio emulator, change localhost to 10.0.2.2
  var token;

  login(String username, String password) async {
    if (!RegExp(r'^[0-9a-zA-Z]*$').hasMatch(username) ||
        !RegExp(r'^[0-9a-zA-Z]*$').hasMatch(password)) return false;

    var data = {
      "grant_type": "password",
      "client_id": "1",
      "client_secret": "q0TQSnghYYktXAogkclyeRSoQBhMJrtfbBTyLG4c",
      "username": username,
      "password": password,
      "scope": "*"
    };

    var fullUrl = Uri.parse(_url + '/oauth/token');
    var res = await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
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

  _getToken() async {
    var localStorage = await SharedPreferences.getInstance();
    if (localStorage.getString('access_token') != null)
      token =
          jsonDecode(localStorage.getString('access_token')!)['access_token'];
    else
      throw ('Token doesn\'t exist.');
  }

  getData(apiUrl) async {
    var fullUrl = Uri.parse(_url + apiUrl);
    await _getToken();
    return await http.get(fullUrl, headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
