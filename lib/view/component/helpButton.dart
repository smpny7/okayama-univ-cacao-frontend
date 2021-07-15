import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HelpButton extends StatelessWidget {
  final IconData? buttonIcon;
  final String? buttonTitle;

  HelpButton(
    this.buttonIcon,
    this.buttonTitle,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton.icon(
            onPressed: () => Navigator.of(context).pushNamed('/Contact'),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size.zero),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              ),
              overlayColor: MaterialStateColor.resolveWith(
                (states) => HexColor('#E9FFFB'),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            icon: Icon(
              buttonIcon ?? Icons.help_outline_rounded,
              color: HexColor('#69F3D8'),
              size: 20,
            ),
            label: Text(
              buttonTitle ?? '',
              style: TextStyle(
                color: HexColor('#69F3D8'),
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
