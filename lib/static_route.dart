
import 'package:flutter/material.dart';
import '/pages/b_page.dart';
import '/pages/a_page.dart';
import '/pages/c_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = '静态路由';
    return MaterialApp(
      title: appName,
      initialRoute: "/", // 默认加载的界面，这里为RootPage
      routes: { // 显式声明路由
        // "/":(context) => RootPage(),
        "/APage":(context) => APage(),
        "/BPage":(context) => BPage(),
        "/CPage":(context) => CPage(),
      },
      home: const MyHomePage(
        title: appName,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

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
            '静态路由',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.yellow),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/APage");
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
