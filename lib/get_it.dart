import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:permission_handler/permission_handler.dart';

GetIt locator = GetIt.instance;

class NavigationService {
  final navigatorKey = new GlobalKey<NavigatorState>();

  BuildContext? getContext() => navigatorKey.currentContext;
  NavigatorState? getState() => navigatorKey.currentState;

  Future<dynamic> pushNamed(String routeName, [Object? arguments]) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
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

  void showScanModalBottomSheet(Function onClosed) {
    showModalBottomSheet(
      context: navigatorKey.currentContext!,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
      ),
      builder: (context) => Container(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    'スキャンの準備ができました',
                    style: TextStyle(
                      color: HexColor('#919191'),
                      fontSize: 28,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(height: 40),
                  SvgPicture.asset(
                    'assets/images/Card.svg',
                    width: 140,
                  ),
                ],
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text(
                  '閉じる',
                  style: TextStyle(
                    color: HexColor('#000000'),
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: HexColor('#D4D3D9'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  onClosed();
                  goBack();
                },
              ),
              height: 50,
              width: 400,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
      ),
    );
  }
}
