import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'component/bottomButtons.dart';

class PasswordAuthentication extends StatefulWidget {
  @override
  _PasswordAuthenticationState createState() => _PasswordAuthenticationState();
}

class _PasswordAuthenticationState extends State<PasswordAuthentication> {
  bool _isPasswordHidden = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    final safePadding = MediaQuery.of(context).padding.top;

    new ThemeData(
      scaffoldBackgroundColor: HexColor('#E5E5E5'),
    );

    return Scaffold(
      backgroundColor: HexColor('#F4FFFD'),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                reverse: bottomSpace != 0,
                child: Column(
                  children: [
                    Container(height: 40 + safePadding),
                    SvgPicture.asset('assets/images/Authentication.svg'),
                    Container(height: 30),
                    Text(
                      '所属団体を認証します',
                      style: TextStyle(
                        color: HexColor('#3F3F3F'),
                        letterSpacing: 2,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(height: 40),
                    Container(
                      width: 320,
                      child: TextFormField(
                          maxLength: 20,
                          style: TextStyle(
                            color: HexColor('#3F3F3F'),
                            letterSpacing: 2,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9a-z]'),
                            ),
                          ],
                          decoration: InputDecoration(
                            counterText: '',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: HexColor('#69F3D8'),
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: HexColor('#69F3D8'),
                                width: 2,
                              ),
                            ),
                            hintText: 'ログインID',
                            contentPadding: const EdgeInsets.all(20.0),
                            hintStyle: TextStyle(color: HexColor('#69F3D8')),
                          ),
                          onChanged: (text) {
                            // TODO:ここで取得したtextを使う
                          }),
                    ),
                    Container(height: 20),
                    Container(
                      width: 320,
                      child: TextField(
                          maxLength: 20,
                          style: TextStyle(
                            color: HexColor('#3F3F3F'),
                            letterSpacing: (2),
                          ),
                          obscureText: _isPasswordHidden,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordHidden
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: HexColor('#69F3D8'),
                              ),
                              onPressed: () => setState(
                                  () => _isPasswordHidden = !_isPasswordHidden),
                            ),
                            counterText: '',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: HexColor('#69F3D8'),
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: HexColor('#69F3D8'),
                                width: 2,
                              ),
                            ),
                            hintText: 'パスワード',
                            contentPadding: const EdgeInsets.all(20.0),
                            hintStyle: TextStyle(color: HexColor('#69F3D8')),
                          ),
                          onChanged: (text) {
                            // TODO:ここで取得したtextを使う
                          }),
                    ),
                    Container(height: 20),
                    Container(height: bottomSpace == 0 ? 0 : bottomSpace - 100),
                  ],
                ),
              ),
            ),
            BottomButtons(
              true,
              true,
              true,
              '次へ',
              'QRコードで認証（推奨）',
              () => null,
              () => Navigator.of(context)
                  .pushReplacementNamed('/QRAuthentication'),
            ),
          ],
        ),
      ),
    );
  }
}
