import 'dart:convert';

import 'package:cacao/get_it.dart';
import 'package:cacao/repository/local_data_source/shared_preferences.dart';
import 'package:cacao/repository/remote_data_source/api.dart';
import 'package:cacao/state/authentication_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:riverpod/riverpod.dart';

class AuthenticationViewModel extends StateNotifier<AuthenticationState> {
  AuthenticationViewModel() : super(const AuthenticationState());

  final NavigationService _navigationService = locator<NavigationService>();

  void setupCamera(QRViewController qrViewController) {
    state = AuthenticationState(qrViewController: qrViewController);
    state.qrViewController?.scannedDataStream.listen(
            (scanData) =>
            _onScanned(describeEnum(scanData.format), scanData.code));
  }

  void _pauseCamera() {
    state = AuthenticationState(isPausingCamera: true);
    state.qrViewController?.pauseCamera();
  }

  void _resumeCamera() {
    state = AuthenticationState(isPausingCamera: false);
    state.qrViewController?.resumeCamera();
  }

  void disposeCamera() => state.qrViewController?.dispose();

  Future<void> _onScanned(String codeType, String? codeData) async {
    if (state.isPausingCamera) return;

    _pauseCamera();
    Fluttertoast.cancel();

    if (codeType != 'qrcode' ||
        codeData == null ||
        !RegExp(r'^[0-9a-zA-Z=&]*$').hasMatch(codeData)) {
      _showAuthenticationFailedToast();
      return;
    }

    var query = Uri.splitQueryString(codeData);

    if (query['id'] == null || query['password'] == null) {
      _showAuthenticationFailedToast();
      return;
    }

    try {
      if (await _loginAndReturnIsSuccessful(query['id']!, query['password']!))
        _navigateToHome();
      else
        _showAuthenticationFailedToast();
    } catch (_) {
      _showNetworkErrorToast();
    }
  }

  // void goBack() => _navigationService.goBack();
  void goBack() async {
    try {
      if (await _loginAndReturnIsSuccessful(
          "987WJTzXrHmhJMg", "ZmJwTp9vbc0CvNJ")
      )
        _navigateToHome();
      else
        _showAuthenticationFailedToast();
    } catch (_) {
      _showNetworkErrorToast();
    }
  }

  Future<bool> _loginAndReturnIsSuccessful(String username,
      String password) async {
    if (!RegExp(r'^[0-9a-zA-Z]*$').hasMatch(username) ||
        !RegExp(r'^[0-9a-zA-Z]*$').hasMatch(password)) return false;

    var data = {
      'grant_type': 'password',
      'client_id': '1',
      'client_secret': dotenv.env['CLIENT_SECRET'],
      'username': username,
      'password': password,
      'scope': '*'
    };

    var url = Uri.parse(dotenv.env['URL']! + '/oauth/token');
    var res = await http.post(url, body: jsonEncode(data), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
    var body = json.decode(res.body);

    if (body['access_token'] == null)
      return false;
    else {
      var sharedPreferences = await SharedPreferencesRepository().init();
      sharedPreferences.setAccessToken(json.encode(body['access_token']));
      sharedPreferences.setRefreshToken(json.encode(body['refresh_token']));
      var roomName = await API().getRoomName();
      sharedPreferences.setRoomName(json.encode(roomName));
      return true;
    }
  }

  void _navigateToHome() {
    _navigationService.popUntil('/StartupView');
    _navigationService.pushReplacementNamed('/HomeView');
  }

  Future<void> _showAuthenticationFailedToast() async {
    Fluttertoast.showToast(
        msg: "認証に失敗しました",
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.white,
        textColor: HexColor('EA4288'),
        fontSize: 16);
    await new Future.delayed(new Duration(seconds: 4));
    _resumeCamera();
  }

  Future<void> _showNetworkErrorToast() async {
    Fluttertoast.showToast(
        msg: "サーバーに接続できません",
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.white,
        textColor: HexColor('EA4288'),
        fontSize: 16);
    await new Future.delayed(new Duration(seconds: 4));
    _resumeCamera();
  }
}
