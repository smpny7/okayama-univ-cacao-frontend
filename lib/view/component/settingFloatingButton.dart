import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(height: 30 + safePadding),
        Container(
          padding: EdgeInsets.only(right: 30),
          width: double.infinity,
          alignment: Alignment.centerRight,
          child: FloatingActionButton(
            onPressed: () => Navigator.of(context).pushNamed('/Settings'),
            child: Icon(
              Icons.settings,
              color: HexColor('#FFFFFF'),
            ),
            backgroundColor: HexColor("#FF839C"),
          ),
        ),
      ],
    );
  }
}
