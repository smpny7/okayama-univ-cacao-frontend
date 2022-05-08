import 'dart:async';

import 'package:cacao/provider/home_provider.dart';
import 'package:cacao/ui/atoms/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _homeProvider = ref.watch(homeProvider.notifier);
    final _safePadding = useState(0.0);

    useEffect(() {
      _homeProvider.onLoad();
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      Future.delayed(Duration.zero,
          () => _safePadding.value = MediaQuery.of(context).padding.top);
      return null;
    }, const []);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(height: _safePadding.value / 2 + 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/logo.webp'),
                  height: 45,
                ),
                Container(width: 62),
                FloatingActionButton(
                  onPressed: () => Navigator.of(context).pushNamed('/Settings'),
                  child: Icon(
                    Icons.settings,
                    color: HexColor('#FFFFFF'),
                  ),
                  backgroundColor: HexColor("#FF839C"),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/illustration_1.webp'),
                    height: 260,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  '学生証を準備してください',
                  style: TextStyle(
                    color: HexColor('#3F3F3F'),
                    letterSpacing: 1,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: HexColor('#E3E3E3'),
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                Container(height: 30),
                Text(
                  '入室/退室する際は、下のボタンを押し\nて学生証をかざしてください。',
                  style: TextStyle(
                    color: HexColor('#3F3F3F'),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: HexColor('#E3E3E3'),
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                Container(height: _safePadding.value / 2 + 60),
                Button(
                  text: '学生証をスキャン',
                  onTapped: () => _homeProvider.onButtonPressed(),
                ),
                Container(height: _safePadding.value / 2 + 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
