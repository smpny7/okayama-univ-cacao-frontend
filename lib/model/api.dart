import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'auth.dart';

class API {
  Future<String> getClubName() async {
    var fullUrl = Uri.parse(dotenv.env['URL']! + '/api/getClubName');
    var res = await http.get(fullUrl, headers: await _setHeaders());
    var body = json.decode(res.body);
    if (body['success']) return body['data'];
    throw ('Authentication Failed.');
  }

  Future<String> getClubNameFromID(String clubID) async {
    var fullUrl = Uri.parse(dotenv.env['URL']! + '/api/getClubNameFromID');
    Map<String, String> data = {'club_id': clubID};
    var res = await http.post(fullUrl,
        body: jsonEncode(data), headers: await _setHeaders());
    var body = json.decode(res.body);
    if (body['success']) return body['data'];
    throw ('Authentication Failed.');
  }

  Future getStudentStatus(String studentID) async {
    var fullUrl = Uri.parse(dotenv.env['URL']! + '/api/status');
    Map<String, String> data = {'student_id': studentID};
    var res = await http.post(fullUrl,
        body: jsonEncode(data), headers: await _setHeaders());
    var body = json.decode(res.body);
    return body;
  }

  Future<bool> enterRoomAndReturnIsSuccessful(
      String studentID, double bodyTemp) async {
    var fullUrl = Uri.parse(dotenv.env['URL']! + '/api/enter');
    Map<String, String> data = {
      'student_id': studentID,
      'body_temp': bodyTemp.toString(),
    };
    var res = await http.post(fullUrl,
        body: jsonEncode(data), headers: await _setHeaders());
    var body = json.decode(res.body);
    return body['success'] == true;
  }

  Future<bool> leaveRoomAndReturnIsSuccessful(String studentID) async {
    var fullUrl = Uri.parse(dotenv.env['URL']! + '/api/leave');
    Map<String, String> data = {'student_id': studentID};
    var res = await http.post(fullUrl,
        body: jsonEncode(data), headers: await _setHeaders());
    var body = json.decode(res.body);
    return body['success'] == true;
  }

  Future<Map<String, String>> _setHeaders() async => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${await Auth().getToken()}'
      };
}
