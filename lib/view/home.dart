import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:cacao/model/api.dart';
import 'package:cacao/model/nfc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

import 'component/bottomButtons.dart';
import 'component/settingFloatingButton.dart';
import 'modal/forceLeave.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String clubName = '';
  late String greeting = '';
  late double safePadding = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);

    _setClubName();
    _setGreeting();
    _setSafePadding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#C1EAEA'),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  child: SvgPicture.asset('assets/images/HomeBackground.svg'),
                  transform: Matrix4.translationValues(0.0, -55.0, 0.0),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(height: 50 + safePadding),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        clubName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: HexColor('#FFFFFF'),
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
                        '18:00',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: HexColor('#FFFFFF'),
                          letterSpacing: 2,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(height: 120),
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
                SettingFloatingButton(),
              ],
            ),
          ),
          BottomButtons(true, false, true, '学生証をスキャン', null,
              () => _onBottomButtonPressed(), () => null),
        ],
      ),
    );
  }

  _setClubName() async {
    var localStorage = await SharedPreferences.getInstance();
    var clubName = await jsonDecode(localStorage.getString('club_name')!);
    setState(() => this.clubName = clubName);
  }

  _setGreeting() => setState(() => this.greeting = (() {
        var h = DateTime.now().hour;
        if (6 <= h && h < 12) return 'おはようございます';
        if (12 <= h && h < 17) return 'こんにちは';
        return 'こんばんは';
      })());

  _setSafePadding() => Future.delayed(
      Duration.zero,
      () => setState(
          () => this.safePadding = MediaQuery.of(context).padding.top));

  _onBottomButtonPressed() {
    if (Platform.isIOS)
      _iOSFeliCaScan();
    else if (Platform.isAndroid) {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        builder: (context) => Container(
          child: Column(
            children: [
              Container(height: 100),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  NfcManager.instance.stopSession();
                },
                child: Text('閉じる'),
              ),
            ],
          ),
        ),
      );
      _androidFeliCaScan();
      print('SCAN');
    }
  }

  _androidFeliCaScan() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      NfcF? nfcf = NfcF.from(tag);

      if (nfcf == null)
        throw ('FeliCaに非対応');
      else {
        Navigator.of(context).pop();
        var studentID = await NFC().readFelicaOnAndroid(nfcf);
        print(studentID);
        NfcManager.instance.stopSession();
        _getStudentStatus(studentID);
      }
    });
  }

  _iOSFeliCaScan() {
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
      else if (!res['data']['is_my_room'])
        Navigator.of(context).pushNamed('/ForceLeaveModal',
            arguments: ForceLeaveArguments(
                studentID: studentID, clubID: res['data']['active_club']));
      else
        _leaveRoom(studentID);
    } catch (e) {
      Navigator.of(context).pushNamed('/NetworkErrorModal');
    }
  }

  _leaveRoom(studentID) async {
    AudioCache player = AudioCache();
    if (await API().leaveRoomAndReturnIsSuccessful(studentID)) {
      player.play('sounds/success.mp3');
      if (await Vibration.hasVibrator() ?? false) Vibration.vibrate();
      Navigator.of(context).popUntil(ModalRoute.withName('/Home'));
      Navigator.of(context).pushNamed('/LeaveSuccessfulModal');
    } else {
      Navigator.of(context).popUntil(ModalRoute.withName('/Home'));
      Navigator.of(context).pushNamed('/NetworkErrorModal');
    }
  }
}
