import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:i10jan/model/api.dart';
import 'package:i10jan/view/component/bottomButtons.dart';

import 'component/backFloatingButton.dart';

class MedicalConsultationArguments {
  MedicalConsultationArguments(
      {required this.studentID, required this.bodyTemp});

  final String studentID;
  final double bodyTemp;
}

class MedicalConsultation extends StatefulWidget {
  @override
  _MedicalConsultationState createState() => _MedicalConsultationState();
}

class _MedicalConsultationState extends State<MedicalConsultation> {
  bool _checkBox0 = false;
  bool _checkBox1 = false;
  bool _checkBox2 = false;

  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;
    final args = ModalRoute.of(context)!.settings.arguments
        as MedicalConsultationArguments;

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
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(height: 50 + safePadding),
                        SizedBox(
                          height: 193,
                          width: 193,
                          child: SvgPicture.asset(
                              'assets/images/SaveTheWorld.svg'),
                        ),
                        Container(height: 30),
                        Text(
                          '調査にご協力ください',
                          style: TextStyle(
                            color: HexColor('#3F3F3F'),
                            letterSpacing: 2,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(height: 30),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Theme(
                            data: ThemeData(
                              unselectedWidgetColor: HexColor('#26DAB8'),
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                CheckboxListTile(
                                  activeColor: HexColor('#26DAB8'),
                                  contentPadding: EdgeInsets.only(left: 0),
                                  value: _checkBox0,
                                  title: Text(
                                    '現在の体調は良好です',
                                    style: TextStyle(
                                      color: HexColor('#3F3F3F'),
                                      letterSpacing: 2,
                                      fontSize: 20,
                                    ),
                                  ),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (value) =>
                                      setState(() => _checkBox0 = value!),
                                ),
                                CheckboxListTile(
                                  activeColor: HexColor('#26DAB8'),
                                  contentPadding: EdgeInsets.only(left: 0),
                                  value: _checkBox1,
                                  title: Text(
                                    '息苦しさなどの症状は\nありません',
                                    style: TextStyle(
                                      color: HexColor('#3F3F3F'),
                                      letterSpacing: 2,
                                      fontSize: 20,
                                    ),
                                  ),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (value) =>
                                      setState(() => _checkBox1 = value!),
                                ),
                                CheckboxListTile(
                                  activeColor: HexColor('#26DAB8'),
                                  contentPadding: EdgeInsets.only(left: 0),
                                  value: _checkBox2,
                                  title: Text(
                                    'だるさや倦怠感を\n感じることはありません',
                                    style: TextStyle(
                                      color: HexColor('#3F3F3F'),
                                      letterSpacing: 2,
                                      fontSize: 20,
                                    ),
                                  ),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (value) =>
                                      setState(() => _checkBox2 = value!),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          BottomButtons(true, false, _checkBox0 && _checkBox1 && _checkBox2,
              '完了', null, () => _enterRoom(args), () => null),
        ],
      ),
    );
  }

  _enterRoom(args) async {
    AudioCache player = AudioCache();
    if (await API().enterRoomAndReturnIsSuccessful(args.studentID,
        args.bodyTemp, '2eb408f0-dd3a-11eb-ba9e-77ab29becfd5')) {
      player.play('sounds/success.mp3');
      Navigator.of(context).popUntil(ModalRoute.withName('/Home'));
    } else {
      Navigator.of(context).pushNamed('/NetworkErrorModal');
    }
  }
}
