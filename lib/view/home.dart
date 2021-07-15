import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:cacao/model/api.dart';
import 'package:cacao/model/nfc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import "package:intl/intl.dart";
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

import 'component/settingFloatingButton.dart';
import 'modal/forceLeave.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String clubName = '';
  late String greeting = '';
  late String time = '--:--';
  late double safePadding = 0;
  late double height = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);

    _setClubName();
    _setGreeting();
    _setSafePadding();
    Future.delayed(Duration.zero,
        () => setState(() => this.height = MediaQuery.of(context).size.width));
    Timer.periodic(Duration(seconds: 1), _setClock);
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
                  child: SvgPicture.asset(
                    'assets/images/HomeBackground.svg',
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.cover,
                  ),
                  transform: Matrix4.translationValues(0.0, -55.0, 0.0),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(height: 45 + safePadding),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        clubName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: HexColor('#FFFFFF'),
                          letterSpacing: 2,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        time,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: HexColor('#FFFFFF'),
                          letterSpacing: 2,
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SettingFloatingButton(),
              ],
            ),
          ),
          SizedBox(
            child: ElevatedButton(
              child: Text(
                '学生証をスキャン',
                style: TextStyle(
                  color: HexColor('#FFFFFF'),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                ),
              ),
              onPressed: () => _onBottomButtonPressed(),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                primary: HexColor('#FF839C'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            height: 60,
            width: 320,
          ),
          Container(height: safePadding + 5),
        ],
      ),
    );
  }

  _setClock(Timer timer) {
    var now = DateTime.now();
    var dateFormat = DateFormat('HH:mm');
    var timeString = dateFormat.format(now);
    setState(() => this.time = timeString);
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
          borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
        ),
        builder: (context) => Container(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'スキャンの準備ができました',
                      style: TextStyle(
                        color: HexColor('#919191'),
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Container(height: 40),
                    SvgPicture.asset(
                      'assets/images/Card.svg',
                      width: 140,
                    ),
                  ],
                ),
              ),
              Container(
                child: ElevatedButton(
                  child: Text(
                    '閉じる',
                    style: TextStyle(
                      color: HexColor('#000000'),
                      fontSize: 17,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: HexColor('#D4D3D9'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    NfcManager.instance.stopSession();
                  },
                ),
                height: 50,
                width: 400,
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
        ),
      );
      _androidFeliCaScan();
    } else
      throw ('対応していないプラットフォームです');
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
