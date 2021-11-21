import 'package:flutter/material.dart';
import 'tool/tools.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      builder: (BuildContext context, Widget child) {
        return FlutterSmartDialog(child: child);
      },
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
        title: Text('测试'),
      ),
      body: Builder(builder: (context) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showSnackBar(context, "提示");
              },
              child: Text('showSnackBar'),
            ),
            myTooltip('Tooltip'),
            ElevatedButton(
              onPressed: () {
                SmartDialog.showToast('test toast');
              },
              child: Text('toast'),
            ),
            ElevatedButton(
              onPressed: () async {
                SmartDialog.showLoading(msg: 'loading');
                await Future.delayed(Duration(seconds: 2));
                SmartDialog.dismiss();
              },
              child: Text('loading'),
            ),
            ElevatedButton(
              onPressed: () {
                alertDialog(context).then((value) => print(value));
              },
              child: Text('alertDialog'),
            ),
            ElevatedButton(
              onPressed: () {
                alertSimpleDialog(context).then((value) => print(value));
              },
              child: Text('alertSimpleDialog'),
            ),
            ElevatedButton(
              onPressed: () {
                modeBottomDialog(context).then((value) => print(value));
              },
              child: Text('modeBottomDialog'),
            ),
          ],
        );
      }),
    );
  }
}
