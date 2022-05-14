import 'package:cacao/get_it.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../ui/pages/temperature_view.dart';
import '../ui/pages/home_view.dart';
import 'medicalConsultation.dart';
import 'modal/authenticationFailed.dart';
import 'modal/forceLeave.dart';
import 'modal/leaveSuccessful.dart';
import 'modal/networkError.dart';
import 'page/contact.dart';
import 'page/guidelinesForHealth.dart';
import 'page/notice.dart';
import 'page/privacyPolicy.dart';
import '../ui/pages/startup_view.dart';
import '../ui/pages/authentication_view.dart';
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
        highlightColor: HexColor('#FFF0F2'),
        primarySwatch: Colors.blue,
        splashColor: HexColor('#FFF0F2'),
      ),
      locale: Locale('ja', 'JP'),
      initialRoute: initialRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      routes: <String, WidgetBuilder>{
        '/StartupView': (BuildContext context) => StartupView(),
        '/AuthenticationView': (BuildContext context) => AuthenticationView(),
        '/HomeView': (BuildContext context) => HomeView(),
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
