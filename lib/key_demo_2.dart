import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(Screen());
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List<Widget> widgets = [
    StatefulContainer(),
    StatefulContainer(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: switchWidget,
          child: Icon(Icons.swipe),
        ),
      ),
    );
  }

  switchWidget(){
    widgets.insert(0, widgets.removeAt(1));
    setState(() {});
  }


}
class StatefulContainer extends StatefulWidget {
  StatefulContainer({Key key}) : super(key: key);
  @override
  State<StatefulContainer> createState() => _StatefulContainerState();
}

class _StatefulContainerState extends State<StatefulContainer> {
  final Color color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}