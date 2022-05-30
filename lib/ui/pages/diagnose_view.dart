import 'package:cacao/ui/atoms/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:styled_widget/styled_widget.dart';

class DiagnoseView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final _temperatureState = ref.watch(temperatureProvider);
    // final _temperatureProvider = ref.watch(temperatureProvider.notifier);

    final _safePadding = useState(0.0);
    final _spaceRate = useState(0.0);
    final _isChecked1 = useState(false);
    final _isChecked2 = useState(false);
    final _isChecked3 = useState(false);

    useEffect(() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      Future.delayed(Duration.zero, () {
        _safePadding.value = MediaQuery.of(context).padding.top;
        _spaceRate.value = (MediaQuery.of(context).size.height - 667) / 6;
        // _temperatureProvider.onLoad();
      });
      return null;
    }, const []);

    Widget _checkBox(String text, ValueNotifier checkStatus) => Styled.widget(
          child: Container(
            child: Row(
              children: [
                Container(width: 15),
                checkStatus.value
                    ? ShaderMask(
                        child: Icon(
                          Icons.check_box,
                          color: Colors.white,
                        ),
                        shaderCallback: (Rect rect) {
                          return LinearGradient(
                            colors: [
                              HexColor('#FF598B'),
                              HexColor('#FF8D86'),
                            ],
                          ).createShader(rect);
                        },
                      )
                    : ShaderMask(
                        child: Icon(
                          Icons.check_box_outline_blank,
                          color: Colors.white,
                        ),
                        shaderCallback: (Rect rect) {
                          return LinearGradient(
                            colors: [
                              HexColor('#FF598B'),
                              HexColor('#FF8D86'),
                            ],
                          ).createShader(rect);
                        },
                      ),
                Container(width: 15),
                GradientText(
                  text,
                  colors: [
                    HexColor('#FF598B'),
                    HexColor('#FF8D86'),
                  ],
                  gradientDirection: GradientDirection.ttb,
                  gradientType: GradientType.linear,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),
        )
            .alignment(Alignment.center)
            .ripple()
            .backgroundColor(Colors.white, animate: true)
            .clipRRect(all: 20)
            .borderRadius(all: 20, animate: true)
            .elevation(
              checkStatus.value ? 0 : 10,
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.white,
            )
            .constrained(height: 80)
            .height(text.contains('\n') ? 90 : 62)
            .width(310)
            .gestures(onTap: () => checkStatus.value = !checkStatus.value)
            .scale(all: checkStatus.value ? 0.95 : 1.0, animate: true)
            .animate(Duration(milliseconds: 150), Curves.easeOut);

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
                  children: [
                    Container(height: _safePadding.value / 2 + 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          onPressed: () => Navigator.of(context).pop(),
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size.zero),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.fromLTRB(15, 10, 25, 10),
                            ),
                            overlayColor: MaterialStateColor.resolveWith(
                              (states) => HexColor('#F88C9A'),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: HexColor("#FAD5DE"),
                            size: 20,
                          ),
                          label: Text(
                            "戻る",
                            style: TextStyle(
                              color: HexColor("#FAD5DE"),
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(width: 240),
                      ],
                    ),
                    Container(height: _spaceRate.value + 10),
                    Container(
                      padding: EdgeInsets.only(right: 30),
                      child: Text(
                        'チェックしてください',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(height: 5),
                    Container(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        '全てにチェックをすることで入室できます',
                        style: TextStyle(
                          color: HexColor("#FAD5DE"),
                          fontSize: 14,
                          height: 1.6,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    Container(height: _spaceRate.value + 25),
                    Column(
                      children: [
                        _checkBox('現在の体調は良好です', _isChecked1),
                        Container(height: 15),
                        _checkBox('息苦しさなどの症状は\nありません', _isChecked2),
                        Container(height: 15),
                        _checkBox('だるさや倦怠感を\n感じることはありません', _isChecked3),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Button(
                    text: '完了',
                    isActive: _isChecked1.value &&
                        _isChecked2.value &&
                        _isChecked3.value,
                    isPrimaryColor: false,
                    onTapped: () => null,
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
