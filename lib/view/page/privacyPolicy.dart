import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<PrivacyPolicy> {
  late WebViewController _controller;

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
        title: Text('プライバシーポリシー'),
      ),
      body: WebView(
        onWebViewCreated: (WebViewController webViewController) async {
          _controller = webViewController;
          await _loadHtmlFromAssets();
        },
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  Future _loadHtmlFromAssets() async {
    final fileText = await rootBundle.loadString('assets/privacyPolicy.html');
    await _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
