import 'dart:convert';

import 'package:cacao/repository/local_data_source/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class API {
  Future<bool> hasValidToken() async {
    var url = Uri.parse(dotenv.env['URL']! + '/api/getRoomName');
    var res = await http.get(url, headers: await _setHeaders());
    var body = json.decode(res.body);
    return body['success'] == true;
  }

  Future<String> getRoomName() async {
    var url = Uri.parse(dotenv.env['URL']! + '/api/getRoomName');
    var res = await http.get(url, headers: await _setHeaders());
    print(res.body.toString());
    var body = json.decode(res.body);
    if (body['success']) return body['data'];
    throw ('Connection failed.');
  }

  Future<String> getRoomNameFromID(String roomID) async {
    var url = Uri.parse(dotenv.env['URL']! + '/api/getRoomNameFromID');
    Map<String, String> data = {'room_id': roomID};
    var res = await http.post(url,
        body: jsonEncode(data), headers: await _setHeaders());
    var body = json.decode(res.body);
    if (body['success']) return body['data'];
    throw ('Connection failed.');
  }

  Future getStudentStatus(String studentID) async {
    var url = Uri.parse(dotenv.env['URL']! + '/api/status');
    Map<String, String> data = {'student_id': studentID};
    var res = await http.post(url,
        body: jsonEncode(data), headers: await _setHeaders());
    var body = json.decode(res.body);
    if (body['success']) return body['data'];
    throw ('Connection failed.');
  }

  Future<bool> enterRoomAndReturnIsSuccessful(
      String studentID, double bodyTemp) async {
    var url = Uri.parse(dotenv.env['URL']! + '/api/enter');
    Map<String, String> data = {
      'student_id': studentID,
      'body_temp': bodyTemp.toString(),
    };
    var res = await http.post(url,
        body: jsonEncode(data), headers: await _setHeaders());
    var body = json.decode(res.body);
    return body['success'] == true;
  }

  Future<bool> leaveRoomAndReturnIsSuccessful(String studentID) async {
    var url = Uri.parse(dotenv.env['URL']! + '/api/leave');
    Map<String, String> data = {'student_id': studentID};
    var res = await http.post(url,
        body: jsonEncode(data), headers: await _setHeaders());
    var body = json.decode(res.body);
    return body['success'] == true;
  }

  Future<Map<String, String>> _setHeaders() async {
    var sharedPreferences = await SharedPreferencesRepository().init();
    var accessToken = await sharedPreferences.getAccessToken();
    if(accessToken != null)
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jsonDecode(accessToken)}'
    };
    else
      throw ('Token does not exist.');
  }
}
