import 'package:cacao/get_it.dart';
import 'package:cacao/repository/local_data_source/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'view/app.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  final sharedPreferences = await SharedPreferencesRepository().init();
  final isLogged = await sharedPreferences.getAccessToken() != null;
  final App app = App(
    initialRoute: isLogged ? '/HomeView' : '/StartupView',
  );

  locator.registerLazySingleton(() => NavigationService());
  runApp(ProviderScope(child: app));
}
