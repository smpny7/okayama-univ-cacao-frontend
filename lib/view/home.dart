import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i10jan/model/nfc.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';

import 'component/bottomButtons.dart';
import 'component/noticeButton.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;

    if (Platform.isAndroid) _startAndroidScan();

    return Scaffold(
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
                          fontFamily: 'NotoSansJP',
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
                        '電子計算機研究会さん',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: HexColor('#3F3F3F'),
                          letterSpacing: 2,
                          fontFamily: 'NotoSansJP',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(height: 120),
                    SvgPicture.asset(
                      'assets/CreditCard.svg',
                      width: 200,
                    ),
                    Container(height: 40),
                    Text(
                      Platform.isAndroid ? '学生証を背面にかざしてください' : '',
                      style: TextStyle(
                        color: HexColor('#3F3F3F'),
                        letterSpacing: 2,
                        fontFamily: 'NotoSansJP',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                NoticeButton(() => null),
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
        Navigator.of(context).pushNamed('/AuthenticationFailed');
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
        // Navigator.of(context).pushNamed('');
      }
    });
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
