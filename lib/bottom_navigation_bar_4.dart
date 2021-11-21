import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'tool/tools.dart';

import 'bottom_nav_pages/bottom_nav_pages_a.dart';
import 'bottom_nav_pages/bottom_nav_pages_b.dart';
import 'bottom_nav_pages/bottom_nav_pages_c.dart';
import 'bottom_nav_pages/bottom_nav_pages_d.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int lastTime = 0;
  PageController pageController;
  int page = 0;
  String title = '首页';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: PageView(
            children: <Widget>[ HomePage(
              title: this.title,
            ),
              BusinessPage(
                title: this.title,
              ),
              MyLocationPage(
                title: this.title,
              ),
              PersonPage(
                title: this.title,
              )],
            onPageChanged: onPageChanged,
            controller: pageController,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: Theme.of(context).accentColor,
            //CircularNotchedRectangle 意思是一个带有圆形缺口的矩形
            shape: CircularNotchedRectangle(),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        onTap(0);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.home, color: getColor(0)),
                          Text("首页", style: TextStyle(color: getColor(0)))
                        ],
                      )),
                  GestureDetector(
                      onTap: () {
                        onTap(1);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.forum, color: getColor(1)),
                          Text("论坛", style: TextStyle(color: getColor(1)))
                        ],
                      )),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        color: Colors.transparent,
                      ),

                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        onTap(2);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.mail, color: getColor(2)),
                          Text("消息", style: TextStyle(color: getColor(2)))
                        ],
                      )),
                  GestureDetector(
                      onTap: () {
                        onTap(3);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.person, color: getColor(3)),
                          Text("我的", style: TextStyle(color: getColor(3)))
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
        onWillPop: () {
          int newTime = DateTime.now().millisecondsSinceEpoch;
          int result = newTime - lastTime;
          lastTime = newTime;
          if (result > 2000) {
            showWarnToast("提示");
          } else {
            SystemNavigator.pop();
          }
          return null;
        });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: this.page);
  }

  void onPageChanged(int value) {
    setState(() {
      this.page = value;
    });
  }

  Color getColor(int value) {
    return this.page == value
        ? Theme.of(context).cardColor
        : Color(0XFFBBBBBB);
  }

  void onTap(int value) {
    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 100), curve: Curves.ease);
  }
}
