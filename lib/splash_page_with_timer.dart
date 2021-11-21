import 'package:flutter/material.dart';
import 'pages/index_page.dart';

class SplashPageWithTimer extends StatefulWidget {
  SplashPageWithTimer({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _SplashPageWithTimerState();
  }
}

class _SplashPageWithTimerState extends State<SplashPageWithTimer> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), _toIndexPage);
    super.initState();
  }

  _toIndexPage() {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return IndexPage();
    }), (route) => route == null);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        child: Image(
          image: AssetImage('assets/images/splash.gif'),
          fit: BoxFit.fill,
        ),
      );
    });
  }
}
