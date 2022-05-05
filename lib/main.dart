import 'package:cacao/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'model/auth.dart';
import 'view/app.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  final bool isLogged = await Auth().isLogged();
  final App app = App(
    initialRoute: isLogged ? '/Home' : '/QRAuthentication',
  );

  locator.registerLazySingleton(() => NavigationService());
  runApp(ProviderScope(child: app));
}
