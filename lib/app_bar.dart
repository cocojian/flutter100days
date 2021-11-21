import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'tool/tools.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final SystemUiOverlayStyle _style =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  @override
  Widget build(BuildContext context) {
    final title = 'app bar';
    SystemChrome.setSystemUIOverlayStyle(_style);
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  showWarnToast("提示");
                }),
            PopupMenuButton<String>(
              padding: EdgeInsets.all(0),
              itemBuilder: (context) => [
                PopupMenuItem<String>(
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                      Text(
                        '邮件邮件邮件',
                        style: TextStyle(
                            fontSize: 18, backgroundColor: Colors.red),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  value: 'mail',
                ),
                PopupMenuItem<String>(
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.black),
                      Text(
                        '搜索',
                        style: TextStyle(
                            fontSize: 18, backgroundColor: Colors.red),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  value: 'search',
                ),
              ],
              onSelected: (value) {
                switch (value) {
                  case 'mail':
                    showWarnToast(value);
                    break;
                  case 'search':
                    showWarnToast(value);
                    break;
                }
              },
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            new Center(),
          ],
        ),
      ),
    );
  }
}
