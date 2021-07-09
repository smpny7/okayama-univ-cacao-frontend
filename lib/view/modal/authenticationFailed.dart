import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i10jan/view/component/bottomButtons.dart';
import 'package:i10jan/view/component/helpButton.dart';

class AuthenticationFailed extends StatefulWidget {
  @override
  _AuthenticationFailedState createState() => _AuthenticationFailedState();
}

class _AuthenticationFailedState extends State<AuthenticationFailed> {
  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(height: 200 + safePadding),
                  SvgPicture.asset('assets/Rejected.svg'),
                  Container(height: 70),
                  Text(
                    '認証に失敗しました',
                    style: TextStyle(
                      color: HexColor("#3F3F3F"),
                      letterSpacing: 2,
                      fontFamily: "NotoSansJP",
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  HelpButton(null, 'お困りの方はこちら', () => null)
                ],
              ),
            ),
            BottomButtons(true, false, true, '戻る', '',
                () => Navigator.of(context).pop(), () => null),
          ],
        ),
      ),
    );
  }
}
