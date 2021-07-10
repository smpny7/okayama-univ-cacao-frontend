import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'auth.dart';

class API {
  Future<bool> enterRoomAndReturnIsSuccessful(
      String studentID, double bodyTemp, String clubID) async {
    var fullUrl = Uri.parse(dotenv.env['URL']! + '/api/enter');
    Map<String, String> data = {
      'student_id': studentID,
      'body_temp': bodyTemp.toString(),
      'club_id': clubID
    };
    var res = await http.post(fullUrl,
        body: jsonEncode(data), headers: await _setHeaders());
    var body = json.decode(res.body);
    return body['success'] == true;
  }

  // getData(apiUrl) async {
  //   var fullUrl = Uri.parse(_url + apiUrl);
  //   await _getToken();
  //   return await http.get(fullUrl, headers: _setHeaders());
  // }

  Future<Map<String, String>> _setHeaders() async => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${await Auth().getToken()}'
      };
}
