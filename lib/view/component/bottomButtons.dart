import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BottomButtons extends StatelessWidget {
  final bool showButton;
  final bool showTextButton;
  final bool isActive;
  final String? buttonTitle;
  final String? textButtonTitle;
  final Function buttonFunction;
  final Function textButtonFunction;

  BottomButtons(
      this.showButton,
      this.showTextButton,
      this.isActive,
      this.buttonTitle,
      this.textButtonTitle,
      this.buttonFunction,
      this.textButtonFunction);

  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        showButton
            ? ElevatedButton(
                onPressed: isActive ? () => buttonFunction() : null,
                style: ElevatedButton.styleFrom(
                  elevation: isActive ? 2 : 0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: isActive
                            ? [
                                HexColor('#26DAB8'),
                                HexColor('#69F3D8'),
                              ]
                            : [
                                HexColor('#D6FBF4'),
                                HexColor('#D6FBF4'),
                              ]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: 320,
                    height: 55,
                    alignment: Alignment.center,
                    child: Text(
                      buttonTitle ?? '',
                      style: TextStyle(
                        color: HexColor('#FFFFFF'),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0,
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
        Container(height: 10),
        showTextButton
            ? TextButton(
                onPressed: () => textButtonFunction(),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                  overlayColor: MaterialStateColor.resolveWith(
                    (states) => HexColor('#F4FFFD'),
                  ),
                ),
                child: Text(
                  textButtonTitle ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    color: HexColor('#27DAB8'),
                  ),
                ),
              )
            : Container(height: 10),
        Container(height: safePadding / 2 + 15),
      ],
    );
  }
}
