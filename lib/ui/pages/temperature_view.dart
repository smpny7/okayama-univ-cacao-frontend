import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BodyTemperature extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _safePadding = useState(0.0);
    final _spaceRate = useState(0.0);

    useEffect(() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      Future.delayed(Duration.zero,
          () => _safePadding.value = MediaQuery.of(context).padding.top);
      Future.delayed(
          Duration.zero,
          () => _spaceRate.value =
              (MediaQuery.of(context).size.height - 667) / 6);
      return null;
    }, const []);

    Widget _textBox({int? value, bool? isFocused}) => Card(
          elevation: 0,
          child: Container(
            child: Center(
              child: Text(
                value?.toString() ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Roboto",
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            height: 90,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: HexColor("#F88C9A"),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            side: (isFocused ?? false)
                ? BorderSide(
                    width: 4,
                    color: HexColor("#F8CBD2"),
                  )
                : BorderSide(style: BorderStyle.none),
          ),
        );

    Widget _numericKeypad() {
      Widget _btn({String? text, Icon? icon, bool? isDisabled}) => SizedBox(
            child: ElevatedButton(
              onPressed: (isDisabled ?? false) ? null : () {},
              child: icon != null
                  ? icon
                  : Text(
                      text ?? '',
                      style: TextStyle(
                        color: HexColor("#090909"),
                        fontFamily: "Roboto",
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(HexColor("#F0F0F0")),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(999),
                    ),
                  ),
                ),
              ),
            ),
            height: 65,
            width: 94,
          );

      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _btn(text: '1'),
              _btn(text: '2'),
              _btn(text: '3'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _btn(text: '4'),
              _btn(text: '5'),
              _btn(text: '6'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _btn(text: '7'),
              _btn(text: '8'),
              _btn(text: '9'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _btn(text: '0'),
              Container(width: 9),
              _btn(
                icon: Icon(
                  Icons.backspace_outlined,
                  color: HexColor("#090909"),
                ),
              ),
            ],
          ),
        ],
      );
    }

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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
              Text(
                '体温を入力してください',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(height: 5),
              Container(
                padding: EdgeInsets.only(right: 60),
                child: Text(
                  '37.5℃以上の方は入室できません',
                  style: TextStyle(
                    color: HexColor("#FAD5DE"),
                    fontSize: 14,
                    // fontWeight: FontWeight.w300,
                    height: 1.6,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              Container(height: _spaceRate.value + 25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _textBox(value: 3),
                  Container(width: 6),
                  _textBox(isFocused: true),
                  Container(width: 8),
                  Text(
                    '.',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(width: 8),
                  _textBox(),
                ],
              ),
              Container(height: _spaceRate.value + 15),
              TextButton.icon(
                onPressed: () =>
                    Navigator.of(context).pushNamed('/GuidelinesForHealth'),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size.zero),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  ),
                  overlayColor: MaterialStateColor.resolveWith(
                    (states) => HexColor('#F88C9A'),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                icon: Icon(
                  Icons.help_outline_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                label: Text(
                  "入力されたデータについて",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(height: _spaceRate.value / 5 + 15),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(height: 20),
                      Container(
                          child: _numericKeypad(), height: 290, width: 301),
                      Container(height: _spaceRate.value + 20),
                    ],
                  ),
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
