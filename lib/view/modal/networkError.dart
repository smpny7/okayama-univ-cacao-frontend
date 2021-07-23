import 'package:cacao/view/component/bottomButtons.dart';
import 'package:cacao/view/component/helpButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class NetworkErrorModal extends StatefulWidget {
  @override
  _NetworkErrorModalState createState() => _NetworkErrorModalState();
}

class _NetworkErrorModalState extends State<NetworkErrorModal> {
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
                  Container(height: 200 + safePadding),
                  SvgPicture.asset('assets/images/Network.svg'),
                  Container(height: 70),
                  Text(
                    'サーバーに接続できません',
                    style: TextStyle(
                      color: HexColor('#3F3F3F'),
                      letterSpacing: 2,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(height: 20),
                  HelpButton(null, 'お困りの方はこちら')
                ],
              ),
            ),
            BottomButtons(true, false, true, '閉じる', '',
                () => Navigator.of(context).pop(), () => null),
          ],
        ),
      ),
    );
  }

  _setSafePadding() => Future.delayed(
      Duration.zero,
          () => setState(
              () => this.safePadding = MediaQuery.of(context).padding.top));
}
