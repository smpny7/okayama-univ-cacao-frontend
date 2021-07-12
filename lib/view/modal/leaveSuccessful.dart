import 'dart:convert';

import 'package:cacao/view/component/bottomButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LeaveSuccessfulModal extends StatefulWidget {
  @override
  _LeaveSuccessfulModalState createState() => _LeaveSuccessfulModalState();
}

class _LeaveSuccessfulModalState extends State<LeaveSuccessfulModal> {
  String clubName = '';

  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;

    _setClubName();

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
                  SvgPicture.asset('assets/images/Logout.svg'),
                  Container(height: 70),
                  Text(
                    '$clubName から\n退室しました',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: HexColor('#3F3F3F'),
                      letterSpacing: 2,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            BottomButtons(true, false, true, '完了', '',
                () => Navigator.of(context).pop(), () => null),
          ],
        ),
      ),
    );
  }

  _setClubName() async {
    var localStorage = await SharedPreferences.getInstance();
    var clubName = await jsonDecode(localStorage.getString('club_name')!);
    setState(() => this.clubName = clubName);
  }
}
