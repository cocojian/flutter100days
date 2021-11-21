import 'package:flutter/material.dart';
import 'pages/index_page.dart';

class SplashPageWithAnimation extends StatefulWidget {
  SplashPageWithAnimation({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _SplashPageWithAnimationState();
  }
}

class _SplashPageWithAnimationState extends State<SplashPageWithAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,

      /// 记得with SingleTickerProviderStateMixin
      duration: Duration(seconds: 3),
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return IndexPage();
          }), (route) => route == null);
        }
      },
    );

    _controller.forward();
  }

  @override
  void dispose() {
    //先释放动画资源，再调用super
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return FadeTransition(
        opacity: _animation,
        child: Container(
          child: Image(
            image: AssetImage('assets/images/splash.gif'),
            fit: BoxFit.fill,
          ),
        ),
      );
    });
  }
}
