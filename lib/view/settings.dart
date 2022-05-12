import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'component/backFloatingButton.dart';
import 'component/bottomButtons.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late double safePadding = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);

    _setSafePadding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F4FFFD'),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  child: SvgPicture.asset('assets/images/Background.svg'),
                  transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                ),
                BackFloatingButton(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(height: 50 + safePadding),
                    SvgPicture.asset(
                      'assets/images/Settings.svg',
                      height: 190,
                      width: 190,
                    ),
                    Container(height: 30),
                    Text(
                      '設定',
                      style: TextStyle(
                        color: HexColor('#3F3F3F'),
                        letterSpacing: 4,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('#FFFFFF'),
                        onPrimary: HexColor('#C5F4EB'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Ink(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          width: 288,
                          child: Text(
                            'お知らせ・更新情報',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: HexColor('#27DAB8'),
                              fontSize: 18,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/Notice'),
                    ),
                    Container(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('#FFFFFF'),
                        onPrimary: HexColor('#C5F4EB'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Ink(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          width: 288,
                          child: Text(
                            'プライバシーポリシー',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: HexColor('#27DAB8'),
                              fontSize: 18,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/PrivacyPolicy'),
                    ),
                    Container(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('#FFFFFF'),
                        onPrimary: HexColor('#C5F4EB'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Ink(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          width: 288,
                          child: Text(
                            'お問い合わせ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: HexColor('#27DAB8'),
                              fontSize: 18,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/Contact'),
                    ),
                    Container(height: 50),
                  ],
                ),
              ],
            ),
          ),
          BottomButtons(
              true, false, true, 'ログアウト', null, () => _logout(), () => null),
        ],
      ),
    );
  }

  _setSafePadding() => Future.delayed(
      Duration.zero,
      () => setState(
          () => this.safePadding = MediaQuery.of(context).padding.top));

  _logout() async {
    var localStorage = await SharedPreferences.getInstance();
    localStorage.remove('access_token');
    localStorage.remove('refresh_token');
    localStorage.remove('room_name');
    Navigator.of(context).popUntil(ModalRoute.withName('/HomeView'));
    Navigator.of(context).pushReplacementNamed('/StartupView');
  }
}
