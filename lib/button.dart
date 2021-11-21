import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '按钮',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("按钮"),
        ),
        body: Column(
          children: [
            ElevatedButton(
              child: Text("ElevatedButton"),
              onPressed: () {},
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.send),
              label: Text("发送"),
              onPressed: () {},
            ),
            TextButton(
              child: Text("TextButton"),
              onPressed: () {},
            ),

            TextButton.icon(
              icon: Icon(Icons.info),
              label: Text("详情"),
              onPressed: () {},
            ),
            OutlinedButton(
              child: Text("OutlinedButton"),
              onPressed: () {},
            ),
            OutlineButton.icon(
              icon: Icon(Icons.add),
              label: Text("添加"),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {},
            )
          ],
        ));
  }
}
