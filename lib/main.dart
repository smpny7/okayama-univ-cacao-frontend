import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:i10jan/model/api.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'readStudentID.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

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
    var data = {
      "grant_type": "password",
      "client_id": "1",
      "client_secret": "q0TQSnghYYktXAogkclyeRSoQBhMJrtfbBTyLG4c",
      "username": "sample",
      "password": "password",
      "scope": "*"
    };

    var res = await Network().authData(data, '/oauth/token');
    var body = json.decode(res.body);
    if (body['access_token'] == null)
      print('認証失敗');
    else {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('access_token', json.encode(body['access_token']));
      localStorage.setString(
          'refresh_token', json.encode(body['refresh_token']));
      print(body['access_token']);
      print(body['refresh_token']);
    }

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
