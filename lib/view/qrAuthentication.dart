import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:permission_handler/permission_handler.dart';

import 'component/bottomButtons.dart';

class QRAuthentication extends StatefulWidget {
  @override
  _QRAuthenticationState createState() => _QRAuthenticationState();
}

class _QRAuthenticationState extends State<QRAuthentication> {
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
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(height: 60 + safePadding),
                  SvgPicture.asset('assets/images/PinCode.svg'),
                  Container(height: 30),
                  Text(
                    '所属団体を認証します',
                    style: TextStyle(
                      color: HexColor('#3F3F3F'),
                      letterSpacing: 1,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(height: 30),
                  Container(
                    padding: EdgeInsets.only(right: 45),
                    child: Text(
                      '学務課より配布された\nQRコードを読み取ってください',
                      style: TextStyle(
                          fontFamily: 'NotoSansJP', fontSize: 17, height: 1.6),
                    ),
                  ),
                ],
              ),
            ),
            BottomButtons(
              true,
              false,
              true,
              '次へ',
              'IDとパスワードで認証',
              () => _createQRCodeScanner(),
              () => Navigator.of(context)
                  .pushReplacementNamed('/PasswordAuthentication'),
            ),
          ],
        ),
      ),
    );
  }

  _createQRCodeScanner() async {
    if (await Permission.camera.request().isGranted)
      Navigator.of(context).pushNamed('/QRCodeScan');
    else
      await showRequestPermissionDialog(context);
  }

  Future<void> showRequestPermissionDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('カメラを許可してください'),
          content: const Text('QRコードを読み取る為にカメラを利用します'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('キャンセル'),
            ),
            ElevatedButton(
              onPressed: () async {
                openAppSettings();
              },
              child: const Text('設定'),
            ),
          ],
        );
      },
    );
  }

  _setSafePadding() => Future.delayed(
      Duration.zero,
      () => setState(
          () => this.safePadding = MediaQuery.of(context).padding.top));
}
