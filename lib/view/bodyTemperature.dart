import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'component/backFloatingButton.dart';
import 'medicalConsultation.dart';

class BodyTemperature extends StatefulWidget {
  @override
  _BodyTemperatureState createState() => _BodyTemperatureState();
}

class _BodyTemperatureState extends State<BodyTemperature> {
  bool isValidTemp = false;
  late double bodyTemp;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    final safePadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: HexColor('#F4FFFD'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: bottomSpace != 0,
              child: Stack(
                children: [
                  Container(
                    child: SvgPicture.asset('assets/images/Background.svg'),
                    transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                  ),
                  BackFloatingButton(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(height: 35 + safePadding),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: SvgPicture.asset(
                          'assets/images/Thermometer.svg',
                          height: 230,
                          width: 230,
                        ),
                      ),
                      Container(height: 30),
                      Text(
                        '体温を入力してください',
                        style: TextStyle(
                          color: HexColor('#3F3F3F'),
                          letterSpacing: 2,
                          fontSize: 22,
                        ),
                      ),
                      Container(
                        width: 200,
                        child: TextFormField(
                          maxLength: 4,
                          style: TextStyle(
                            color: HexColor('#3F3F3F'),
                            fontSize: 22,
                            letterSpacing: 2,
                          ),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9.]')),
                          ],
                          decoration: new InputDecoration(
                            counterText: '',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: HexColor('#69F3D8'),
                                width: 2.5,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: HexColor('#69F3D8'),
                                width: 2.5,
                              ),
                            ),
                          ),
                          onChanged: (text) {
                            double temp;

                            try {
                              temp = double.parse(text);
                              isValidTemp = (temp >= 35.0 &&
                                  temp < 38.0 &&
                                  text.length == 4);
                            } catch (e) {
                              isValidTemp = false;
                            } finally {
                              if (isValidTemp)
                                setState(
                                    () => this.bodyTemp = double.parse(text));
                            }
                          },
                        ),
                      ),
                      Container(height: 50),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                onPressed: isValidTemp
                    ? () => Navigator.of(context).pushNamed(
                        '/MedicalConsultation',
                        arguments: MedicalConsultationArguments(
                            studentID: ModalRoute.of(context)!
                                .settings
                                .arguments
                                .toString(),
                            bodyTemp: bodyTemp))
                    : null,
                style: ElevatedButton.styleFrom(
                  elevation: isValidTemp ? 2 : 0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: isValidTemp
                            ? [
                                HexColor('#26DAB8'),
                                HexColor('#69F3D8'),
                              ]
                            : [
                                HexColor('#D6FBF4'),
                                HexColor('#D6FBF4'),
                              ]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: 320,
                    height: 55,
                    alignment: Alignment.center,
                    child: Text(
                      '次へ',
                      style: TextStyle(
                        color: HexColor('#FFFFFF'),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  height:
                      (bottomSpace != 0 ? safePadding / 3 : safePadding) + 15),
            ],
          ),
        ],
      ),
    );
  }
}
