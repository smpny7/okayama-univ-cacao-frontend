import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i10jan/model/auth.dart';

import 'component/bottomButtons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var now = DateTime.now();
  bool _isAndroid = Platform.isAndroid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(height: 50),
            greeting(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 30),
              child: Text(
                '電子計算機研究会さん',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: HexColor("#3F3F3F"),
                  letterSpacing: 2,
                  fontFamily: "NotoSansJP",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(height: 120),
            SvgPicture.asset(
              'assets/CreditCard.svg',
              height: 150,
              width: 150,
            ),
            Container(height: 40),
            Text(_isAndroid ? '学生証を背面にかざしてください' : '',
                style: TextStyle(
                  color: HexColor("#3F3F3F"),
                  letterSpacing: (2),
                  fontFamily: "NotoSansJP",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
            Container(height: 120),
            BottomButtons(!_isAndroid, true, true, 'スキャン', '学生番号で登録',
                () => null, () => Auth().logout()),
          ],
        ),
      ),
    );
  }

  Container greeting() {
    // TimeZone: Depends on the device
    var nowHour = now.hour;
    String greetingWords;
    if ((0 <= nowHour) && (nowHour < 12)) {
      greetingWords = 'おはようございます';
    } else if ((12 <= nowHour) && (nowHour < 17)) {
      greetingWords = 'こんにちは';
    } else {
      greetingWords = 'こんばんは';
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 30),
      child: Text(
        greetingWords,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: HexColor("#3F3F3F"),
          letterSpacing: 2,
          fontFamily: "NotoSansJP",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
