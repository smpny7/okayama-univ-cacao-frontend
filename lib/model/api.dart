import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String _url = 'http://10.6.27.95:8000';

  //if you are using android studio emulator, change localhost to 10.0.2.2
  var token;

  _getToken() async {
    var localStorage = await SharedPreferences.getInstance();
    if (localStorage.getString('access_token') != null)
      token = jsonDecode(localStorage.getString('access_token')!)['access_token'];
    else
      throw('Token doesn\'t exist.');
  }

  authData(data, apiUrl) async {
    var fullUrl = Uri.parse(_url + apiUrl);
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
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
