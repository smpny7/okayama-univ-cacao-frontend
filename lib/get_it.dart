import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

class NavigationService {
  final navigatorKey = new GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> pushReplacementNamed(String routeName) =>
      navigatorKey.currentState!.pushReplacementNamed(routeName);

  void goBack() => navigatorKey.currentState!.pop();

  void popUntil(String routeName) =>
      navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
}
