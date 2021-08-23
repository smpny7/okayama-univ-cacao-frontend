import 'package:audioplayers/audioplayers.dart';
import 'package:cacao/model/api.dart';
import 'package:cacao/view/component/bottomButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vibration/vibration.dart';

class ForceLeaveArguments {
  ForceLeaveArguments({required this.studentID, required this.roomID});

  final String studentID;
  final String roomID;
}

class ForceLeaveModal extends StatefulWidget {
  @override
  _ForceLeaveModalState createState() => _ForceLeaveModalState();
}

class _ForceLeaveModalState extends State<ForceLeaveModal> {
  late String roomName = '';
  late double safePadding = 0;
  late ForceLeaveArguments args;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);

    _setArgs();
    _setRoomName();
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
                  SvgPicture.asset('assets/images/Triangle.svg'),
                  Container(height: 70),
                  Text(
                    '$roomName から\n退室します',
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
            BottomButtons(true, false, true, '次へ', '',
                () => _leaveRoom(), () => null),
          ],
        ),
      ),
    );
  }

  _setArgs() => Future.delayed(
      Duration.zero,
          () => setState(() => this.args = ModalRoute.of(context)!
          .settings
          .arguments as ForceLeaveArguments));

  _setRoomName() async {
    var roomName = await API().getRoomNameFromID(this.args.roomID);
    setState(() => this.roomName = roomName);
  }

  _setSafePadding() => Future.delayed(
      Duration.zero,
          () => setState(
              () => this.safePadding = MediaQuery.of(context).padding.top));

  _leaveRoom() async {
    AudioCache player = AudioCache();
    print('stuID: ${this.args.studentID}');
    if (!await API().leaveRoomAndReturnIsSuccessful(
        this.args.studentID))
      Navigator.of(context).pushNamed('/NetworkErrorModal');
    else {
      if (await Vibration.hasVibrator() ?? false) Vibration.vibrate();
      player.play('sounds/success.mp3');
      Navigator.of(context).pushReplacementNamed('/BodyTemperature',
          arguments: this.args.roomID);
    }
  }
}
