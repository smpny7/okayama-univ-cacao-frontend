import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'bodyTemperature.dart';
import 'home.dart';
import 'medicalConsultation.dart';
import 'modal/authenticationFailed.dart';
import 'modal/forceLeave.dart';
import 'modal/leaveSuccessful.dart';
import 'modal/networkError.dart';
import 'page/contact.dart';
import 'page/guidelinesForHealth.dart';
import 'page/notice.dart';
import 'page/privacyPolicy.dart';
import 'qrAuthentication.dart';
import 'qrCodeScan.dart';
import 'settings.dart';

class App extends StatelessWidget {
  final String initialRoute;

  App({required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cacao',
      theme: ThemeData(
        fontFamily: 'NotoSansJP',
        highlightColor: HexColor('#E9FFFB'),
        primarySwatch: Colors.blue,
        splashColor: HexColor('#E9FFFB'),
      ),
      locale: Locale('ja', 'JP'),
      initialRoute: initialRoute,
      routes: <String, WidgetBuilder>{
        '/QRAuthentication': (BuildContext context) => QRAuthentication(),
        '/QRCodeScan': (BuildContext context) => QRCodeScan(),
        '/Home': (BuildContext context) => Home(),
        '/BodyTemperature': (BuildContext context) => BodyTemperature(),
        '/MedicalConsultation': (BuildContext context) => MedicalConsultation(),
        '/Settings': (BuildContext context) => Settings(),
        '/Notice': (BuildContext context) => Notice(),
        '/PrivacyPolicy': (BuildContext context) => PrivacyPolicy(),
        '/GuidelinesForHealth': (BuildContext context) => GuidelinesForHealth(),
        '/Contact': (BuildContext context) => Contact(),
        '/AuthenticationFailedModal': (BuildContext context) =>
            AuthenticationFailedModal(),
        '/NetworkErrorModal': (BuildContext context) => NetworkErrorModal(),
        '/LeaveSuccessfulModal': (BuildContext context) =>
            LeaveSuccessfulModal(),
        '/ForceLeaveModal': (BuildContext context) => ForceLeaveModal(),
      },
    );
  }
}
