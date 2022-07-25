import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FiveStarPage extends StatefulWidget {
  @override
  FiveStarPageState createState() => FiveStarPageState();
}

class FiveStarPageState extends State<FiveStarPage> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Apps Review"),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://play.google.com/store/apps/details?id=com.borolocit.allstatusbd',
      ),
    );
  }
}
