import 'dart:convert';

import 'package:cacao/model/credential.dart';
import 'package:cacao/model/enter.dart';
import 'package:cacao/model/leave.dart';
import 'package:cacao/model/room.dart';
import 'package:cacao/model/status.dart';
import 'package:cacao/model/token.dart';
import 'package:cacao/repository/local_data_source/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class API {
  late Uri _baseUrl;
  late String _clientSecret;

  API({String? baseUrl}) {
    // BASE_URL の設定
    var defaultBaseUrl = baseUrl ?? dotenv.env['BASE_URL'];
    if (defaultBaseUrl == null) throw Exception("バックエンドのURLが指定されていません");
    var pos = defaultBaseUrl.length - 1;
    if (defaultBaseUrl.substring(pos - 1) == '/')
      defaultBaseUrl = defaultBaseUrl.substring(0, pos);
    _baseUrl = Uri.parse(defaultBaseUrl);

    // CLIENT_SECRET の設定
    var clientSecret = dotenv.env['CLIENT_SECRET'];
    if (clientSecret == null) throw Exception("クライアントシークレットが設定されていません");
    _clientSecret = clientSecret;
  }

  Future<Token> getTokenWithPassword(Credential credential) async {
    var data = {
      'grant_type': 'password',
      'client_id': '1',
      'client_secret': _clientSecret,
      'username': credential.username,
      'password': credential.password,
      'scope': '*'
    };

    var url = Uri.parse('$_baseUrl/oauth/token');
    try {
      var res = await http.post(url,
          body: jsonEncode(data),
          headers: await _setHeaders(useAccessToken: false));

      return Token.fromJson(jsonDecode(res.body));
    } catch (_) {
      throw Exception("認証に失敗しました");
    }
  }

  Future<bool> hasValidAccessToken() async =>
      await getRoomName().then((_) => true).catchError((_) => false);

  Future<String> getRoomName() async {
    var url = Uri.parse('$_baseUrl/api/getRoomName');
    try {
      var res =
          await http.get(url, headers: await _setHeaders(useAccessToken: true));

      var room = Room.fromJson(jsonDecode(res.body));

      if (!room.success) throw Exception("サーバーで処理が失敗しました");

      return room.data;
    } catch (_) {
      throw Exception("認証に失敗しました");
    }
  }

  Future<String> getRoomNameFromID(String roomID) async {
    var url = Uri.parse('$_baseUrl/api/getRoomNameFromID');
    var body = {'room_id': roomID};
    try {
      var res = await http.post(url,
          body: jsonEncode(body),
          headers: await _setHeaders(useAccessToken: true));

      var room = Room.fromJson(jsonDecode(res.body));

      if (!room.success) throw Exception("サーバーで処理が失敗しました");

      return room.data;
    } catch (_) {
      throw Exception("認証に失敗しました");
    }
  }

  Future<StatusData> getStudentStatus(String studentID) async {
    var url = Uri.parse('$_baseUrl/api/status');
    var body = {'student_id': studentID};
    try {
      var res = await http.post(url,
          body: jsonEncode(body),
          headers: await _setHeaders(useAccessToken: true));

      var status = Status.fromJson(jsonDecode(res.body));

      if (!status.success) throw Exception("サーバーで処理が失敗しました");

      return status.data;
    } catch (_) {
      throw Exception("認証に失敗しました");
    }
  }

  Future<void> enterRoom(String studentID, double bodyTemp) async {
    var url = Uri.parse('$_baseUrl/api/enter');
    var body = {
      'student_id': studentID,
      'body_temp': bodyTemp.toString(),
    };
    try {
      var res = await http.post(url,
          body: jsonEncode(body),
          headers: await _setHeaders(useAccessToken: true));

      var enter = Enter.fromJson(jsonDecode(res.body));

      if (!enter.success) throw Exception("サーバーで処理が失敗しました");
    } catch (_) {
      throw Exception("認証に失敗しました");
    }
  }

  Future<void> leaveRoom(String studentID) async {
    var url = Uri.parse('$_baseUrl/api/leave');
    var body = {'student_id': studentID};
    try {
      var res = await http.post(url,
          body: jsonEncode(body),
          headers: await _setHeaders(useAccessToken: true));

      var leave = Leave.fromJson(jsonDecode(res.body));

      if (!leave.success) throw Exception("サーバーで処理が失敗しました");
    } catch (_) {
      throw Exception("認証に失敗しました");
    }
  }

  Future<Map<String, String>> _setHeaders(
      {required bool useAccessToken}) async {
    if (!useAccessToken)
      return {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

    var sharedPreferences = await SharedPreferencesRepository().init();
    var accessToken = await sharedPreferences.getAccessToken();
    if (accessToken == null)
      throw Exception('アクセストークンがありません');
    else
      return {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken'
        // 'Authorization': 'Bearer ${jsonDecode(accessToken)}'
      };
  }
}
