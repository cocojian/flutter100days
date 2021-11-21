import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = 'Custom Themes';
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        // 1.亮度: light-dark
          brightness: Brightness.light,
          // 2.primarySwatch: primaryColor/accentColor的结合体
          primarySwatch: Colors.red,
          // 3.主要颜色: 导航/底部TabBar
          primaryColor: Colors.pink,
          // 4.次要颜色: FloatingActionButton/按钮颜色
          accentColor: Colors.orange,
          // 5.卡片主题
          cardTheme: CardTheme(
              color: Colors.greenAccent,
              elevation: 10,
              shape: Border.all(width: 3, color: Colors.red),
              margin: EdgeInsets.all(10)
          ),
          // 6.按钮主题
          buttonTheme: ButtonThemeData(
              minWidth: 0,
              height: 25
          ),
          // 7.文本主题
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 30, color: Colors.blue),
            bodyText1: TextStyle(fontSize: 10),
          )
      ),
      home: const MyHomePage(
        title: appName,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key key,  this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            'Text with a background color',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.yellow),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}