import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    print("initState:${DateTime.now()}");
    _loadUserInfo();
    print("initState:${DateTime.now()}");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future _getUserInfo() async {
    await Future.delayed(Duration(milliseconds: 3000));
    return "我是用户";
  }

  Future _loadUserInfo() async {
    print("_loadUserInfo:${DateTime.now()}");
    _getUserInfo().then((info) {
      print(info);
    });
    print("_loadUserInfo:${DateTime.now()}");
  }
}
