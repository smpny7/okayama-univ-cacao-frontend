import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GuidelinesForHealth extends StatefulWidget {
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<GuidelinesForHealth> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#27DAB8'),
        title: Text('入力されたデータについて'),
      ),
      body: WebView(
        initialUrl: 'https://cacao-app.com/guidelinesForHealth',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
