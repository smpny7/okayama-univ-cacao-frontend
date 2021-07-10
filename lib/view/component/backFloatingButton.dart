import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BackFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(left: 20, top: 20 + safePadding / 2),
      width: double.infinity,
      alignment: Alignment.topLeft,
      child: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(
          Icons.arrow_back_ios_new,
          color: HexColor('#0C0E10'),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
