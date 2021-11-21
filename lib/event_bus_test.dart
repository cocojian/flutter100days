import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
import 'widgets/event_bus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //两个页面为兄弟组件
              First_Page(),
              Second_Page(),
            ],
          ),
        )),
      ),
    );
  }
}

class First_Page extends StatelessWidget {
  String text = '我是触发事件,通过Bus传递';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          //Bus触发事件
          eventBus.fire(new UserLoggedInEvent(text));
        },
        child: ElevatedButton(
          child: Text('点击我触发'),
        ),
      ),
    );
  }
}

class Second_Page extends StatefulWidget {
  @override
  _Second_PageState createState() => _Second_PageState();
}

class _Second_PageState extends State<Second_Page> {
  var result;
  var eventBusFn;

  void _listen() {
     eventBusFn =  eventBus.on<UserLoggedInEvent>().listen((event) {
      setState(() {
        result = event.text;
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    //取消订阅
    eventBusFn.cancel();
  }
  @override
  Widget build(BuildContext context) {
    _listen();
    return Container(
      child: Text('${result}'),
    );
  }
}
