import 'package:flutter/material.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('context')),
//         drawer: Drawer(),
//         floatingActionButton: FloatingActionButton(onPressed: () {
//           Scaffold.of(context).openDrawer();
//         }),
//       ),
//     );
//   }
// }
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('context')),
          drawer: Drawer(),
          floatingActionButton: Builder(
            builder: (ctx) {
              return FloatingActionButton(onPressed: () {
                Scaffold.of(ctx).openDrawer();
              });
            },
          )),
    );
  }
}
