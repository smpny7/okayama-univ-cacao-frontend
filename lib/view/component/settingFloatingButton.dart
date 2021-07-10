import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingFloatingButton extends StatelessWidget {
  final Function buttonFunction;

  SettingFloatingButton(this.buttonFunction);

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
            onPressed: () => buttonFunction,
            child: Icon(
              Icons.settings,
              color: HexColor('#FFFFFF'),
            ),
            backgroundColor: HexColor("#27DAB8"),
          ),
        ),
      ],
    );
  }
}
