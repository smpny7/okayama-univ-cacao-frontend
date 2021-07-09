import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:i10jan/model/auth.dart';

import 'view/app.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  final bool isLogged = await Auth().isLogged();
  final App app = App(
    initialRoute: isLogged ? '/Home' : '/QRAuthentication',
  );
  runApp(app);
}
