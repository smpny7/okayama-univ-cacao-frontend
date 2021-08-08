import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Notice extends StatefulWidget {
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<Notice> {
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
        title: Text('お知らせ・更新情報'),
      ),
      body: WebView(
        initialUrl: 'https://cacao-app.com/notice',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
