import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i10jan/model/api.dart';
import 'package:i10jan/model/nfc.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

import 'component/bottomButtons.dart';
import 'component/settingFloatingButton.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String clubName = '';

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;

    if (Platform.isAndroid) _startAndroidScan();

    _setClubName();

    return Scaffold(
      backgroundColor: HexColor('#F4FFFD'),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(height: 50 + safePadding),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        greeting(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: HexColor('#3F3F3F'),
                          letterSpacing: 2,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(height: 10),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        '$clubNameさん',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: HexColor('#3F3F3F'),
                          letterSpacing: 2,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(height: 120),
                    SvgPicture.asset(
                      'assets/images/CreditCard.svg',
                      width: 200,
                    ),
                    Container(height: 40),
                    Text(
                      Platform.isAndroid ? '学生証を背面にかざしてください' : '',
                      style: TextStyle(
                        color: HexColor('#3F3F3F'),
                        letterSpacing: 2,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SettingFloatingButton(() => null),
              ],
            ),
          ),
          BottomButtons(!Platform.isAndroid, true, true, 'スキャン', '学籍番号で登録',
              () => _scannedOniOS(), () => null),
        ],
      ),
    );
  }

  _startAndroidScan() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      NfcF? nfcf = NfcF.from(tag);

      if (nfcf == null)
        throw ('FeliCaに非対応');
      else {
        var studentID = await NFC().readFelicaOnAndroid(nfcf);
        print(studentID);
        NfcManager.instance.stopSession();
        Navigator.of(context).pushNamed('/AuthenticationFailedModal');
      }
    });
  }

  _scannedOniOS() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      FeliCa? felica = FeliCa.from(tag);

      if (felica == null)
        throw ('FeliCaに非対応');
      else {
        var studentID = await NFC().readFelicaOniOS(felica);
        print(studentID);
        NfcManager.instance.stopSession();
        _getStudentStatus(studentID);
      }
    });
  }

  _getStudentStatus(String studentID) async {
    try {
      var res = await API()
          .getStudentStatus(studentID)
          .timeout(const Duration(seconds: 5));
      if (!res['success'])
        Navigator.of(context).pushNamed('/AuthenticationFailedModal');
      if (res['data']['active_club'] == null)
        Navigator.of(context)
            .pushNamed('/BodyTemperature', arguments: studentID);
      else if (!res['data']['is_my_room']) print('XXX から強制退室します');
      else _leaveRoom(studentID);
    } catch (e) {
      Navigator.of(context).pushNamed('/NetworkErrorModal');
    }
  }

  _setClubName() async {
    var localStorage = await SharedPreferences.getInstance();
    var clubName = await jsonDecode(localStorage.getString('club_name')!);
    setState(() => this.clubName = clubName);
  }

  _leaveRoom(studentID) async {
    AudioCache player = AudioCache();
    if (await API().leaveRoomAndReturnIsSuccessful(studentID)) {
      player.play('sounds/success.mp3');
      if (await Vibration.hasVibrator() ?? false) Vibration.vibrate();
      Navigator.of(context).popUntil(ModalRoute.withName('/Home'));
      Navigator.of(context)
          .pushNamed('/LeaveSuccessfulModal');
    } else {
      Navigator.of(context).popUntil(ModalRoute.withName('/Home'));
      Navigator.of(context).pushNamed('/NetworkErrorModal');
    }
  }

  String greeting() {
    var now = DateTime.now();
    var nowHour = now.hour;
    String greetingWords;
    if (6 <= nowHour && nowHour < 12) {
      greetingWords = 'おはようございます';
    } else if (12 <= nowHour && nowHour < 17) {
      greetingWords = 'こんにちは';
    } else {
      greetingWords = 'こんばんは';
    }
    return greetingWords;
  }
}
