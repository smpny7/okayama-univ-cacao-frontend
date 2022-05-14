import 'package:cacao/provider/startup_provider.dart';
import 'package:cacao/ui/atoms/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StartupView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _safePadding = useState(0.0);

    useEffect(() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      Future.delayed(Duration.zero,
          () => _safePadding.value = MediaQuery.of(context).padding.top);
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
                      color: Colors.white,
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
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        height: 1.6,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  Container(height: _safePadding.value / 2 + 60),
                  Button(
                    text: 'QRコードのスキャン',
                    onTapped: () => ref
                        .read(startupProvider.notifier)
                        .scanAuthenticationCode(),
                    isPrimaryColor: false,
                  ),
                  Container(height: _safePadding.value / 2 + 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
