import 'package:cacao/ui/atoms/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class RoomAuthentication extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final safePadding = useState(0.0);

    useEffect(() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      Future.delayed(Duration.zero,
          () => safePadding.value = MediaQuery.of(context).padding.top);
      return null;
    }, const []);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.centerLeft,
            end: FractionalOffset.centerRight,
            colors: [
              HexColor('#FF598B'),
              HexColor('#FF8D86'),
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset('assets/images/code.svg'),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    '所属団体を認証します',
                    style: TextStyle(
                      color: HexColor('#FFFFFF'),
                      letterSpacing: 1,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(height: 30),
                  Container(
                    padding: EdgeInsets.only(right: 40),
                    child: Text(
                      '学務課より配布された\nQRコードを読み取ってください',
                      style: TextStyle(
                        color: HexColor('#FFFFFF'),
                        fontFamily: 'NotoSansJP',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        height: 1.6,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  Container(height: 120),
                  Button(
                    text: 'QRコードのスキャン',
                    onTapped: () => _createQRCodeScanner(context),
                    isPrimaryColor: false,
                  ),
                  Container(height: safePadding.value / 2 + 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _createQRCodeScanner(BuildContext context) async {
    if (await Permission.camera.request().isGranted)
      Navigator.of(context).pushNamed('/QRCodeScan');
    else
      await showRequestPermissionDialog(context);
  }

  Future<void> showRequestPermissionDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('カメラを許可してください'),
          content: const Text('QRコードを読み取る為にカメラを利用します'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('キャンセル'),
            ),
            ElevatedButton(
              onPressed: () async => openAppSettings(),
              child: const Text('設定'),
            ),
          ],
        );
      },
    );
  }
}