import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';

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

  void showPermissionDialog() {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (_) => AlertDialog(
        title: const Text('カメラを許可してください'),
        content: const Text('QRコードを読み取る為にカメラを利用します'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => goBack(),
            child: const Text('キャンセル'),
          ),
          ElevatedButton(
            onPressed: () async => openAppSettings(),
            child: const Text('設定'),
          ),
        ],
      ),
    );
  }
}
