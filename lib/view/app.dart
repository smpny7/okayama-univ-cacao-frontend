import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../readStudentID.dart';
import 'bodyTemperature.dart';
import 'home.dart';
import 'medicalConsultation.dart';
import 'modal/authenticationFailed.dart';
import 'modal/forceLeave.dart';
import 'modal/leaveSuccessful.dart';
import 'modal/networkError.dart';
import 'page/contact.dart';
import 'page/guidelinesForHealth.dart';
import 'page/privacyPolicy.dart';
import 'passwordAuthentication.dart';
import 'qrAuthentication.dart';
import 'qrCodeScan.dart';
import 'settings.dart';

class App extends StatelessWidget {
  final String initialRoute;

  App({required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cacao',
      theme: ThemeData(
        fontFamily: 'NotoSansJP',
        highlightColor: HexColor('#E9FFFB'),
        primarySwatch: Colors.blue,
        splashColor: HexColor('#E9FFFB'),
      ),
      locale:  Locale('ja', 'JP'),
      initialRoute: initialRoute,
      routes: <String, WidgetBuilder>{
        '/QRAuthentication': (BuildContext context) => QRAuthentication(),
        '/PasswordAuthentication': (BuildContext context) =>
            PasswordAuthentication(),
        '/QRCodeScan': (BuildContext context) => QRCodeScan(),
        '/Home': (BuildContext context) => Home(),
        '/BodyTemperature': (BuildContext context) => BodyTemperature(),
        '/MedicalConsultation': (BuildContext context) => MedicalConsultation(),
        '/Settings': (BuildContext context) => Settings(),
        '/PrivacyPolicy': (BuildContext context) => PrivacyPolicy(),
        '/GuidelinesForHealth': (BuildContext context) => GuidelinesForHealth(),
        '/Contact': (BuildContext context) => Contact(),
        '/AuthenticationFailedModal': (BuildContext context) =>
            AuthenticationFailedModal(),
        '/NetworkErrorModal': (BuildContext context) => NetworkErrorModal(),
        '/LeaveSuccessfulModal': (BuildContext context) =>
            LeaveSuccessfulModal(),
        '/ForceLeaveModal': (BuildContext context) => ForceLeaveModal(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? studentId;

  NfcF? nfcf;
  FeliCa? felica;

  bool _isLoading = false;
  bool _isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    _setAuthenticated();

    return Scaffold(
      appBar: AppBar(title: Text("学生証")),
      body: FutureBuilder(
        future: NfcManager.instance.isAvailable(),
        builder: (context, ss) {
          if (ss.data != true)
            return Center(child: Text("対応していません"));
          else
            return Center(
              child: Column(
                children: [
                  Text(
                    studentId ?? '不明',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _readStudentID(),
                    child: Text('読み込み！'),
                  ),
                  ElevatedButton(
                    onPressed: () => _sampleLogin(),
                    child: Text('サンプルログイン'),
                  ),
                  ElevatedButton(
                    onPressed: () => _logout(),
                    child: Text('ログアウト'),
                  ),
                  _isLoading ? Text('読み込み中') : Container(),
                  _isAuthenticated ? Text('認証済み') : Text('未認証'),
                ],
              ),
            );
        },
      ),
    );
  }

  _readStudentID() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      // For Android
      if (Platform.isAndroid) {
        NfcF? nfcf = NfcF.from(tag);

        if (nfcf == null)
          print("FeliCaに非対応");
        else {
          print("FeliCaに対応");
          var studentId = await readFelicaOnAndroid(nfcf);
          setState(() => this.studentId = studentId);
        }
      }

      // For iOS
      if (Platform.isIOS) {
        FeliCa? felica = FeliCa.from(tag);

        if (felica == null)
          print("FeliCaに非対応");
        else {
          print("FeliCaに対応");
          var studentId = await readFelicaOniOS(felica);
          setState(() => this.studentId = studentId);
        }
      }

      NfcManager.instance.stopSession();
    });
  }

  _sampleLogin() async {
    setState(() => _isLoading = true);
    // var data = {
    //   "grant_type": "password",
    //   "client_id": "1",
    //   "client_secret": "q0TQSnghYYktXAogkclyeRSoQBhMJrtfbBTyLG4c",
    //   "username": "sample",
    //   "password": "password",
    //   "scope": "*"
    // };
    //
    // var res = await Network().login('sample', 'password');
    // if (res)
    //   print('認証失敗');
    // else {
    //   SharedPreferences localStorage = await SharedPreferences.getInstance();
    //   localStorage.setString('access_token', json.encode(body['access_token']));
    //   localStorage.setString(
    //       'refresh_token', json.encode(body['refresh_token']));
    //   print(body['access_token']);
    //   print(body['refresh_token']);
    // }

    setState(() => _isLoading = false);
  }

  _setAuthenticated() async {
    var localStorage = await SharedPreferences.getInstance();
    setState(() =>
        _isAuthenticated = localStorage.getString('access_token') != null);
  }

  _logout() async {
    var localStorage = await SharedPreferences.getInstance();
    localStorage.remove('access_token');
    localStorage.remove('refresh_token');
    setState(() => _isAuthenticated = false);
  }
}
