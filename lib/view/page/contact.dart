import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Contact extends StatefulWidget {
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<Contact> {
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
        title: Text('お問い合わせ'),
      ),
      body: WebView(
        initialUrl: 'https://docs.google.com/forms/d/e/1FAIpQLSdS47woHtsbvv6xqjsxJYiej1RjcSDwG9FBWj2ZpEfaQFeD9w/viewform?usp=sf_link',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
