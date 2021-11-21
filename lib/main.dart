import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splash_page.dart';
import 'splash_page_with_timer.dart';
import 'splash_page_with_animation.dart';
import 'widgets/date_picker.dart';
import 'widgets/webview_flutter.dart';
import 'widgets/webview_flutter_2.dart';
import 'widgets/webview_flutter_load_html.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

InAppLocalhostServer localhostServer = new InAppLocalhostServer();

void main() async {
  await localhostServer.start();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = '';
    String localUrl = 'assets/index.html';
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return new MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: WebViewPageLoadHTML(url:localUrl, isLocalUrl: true)
    );
  }
}
