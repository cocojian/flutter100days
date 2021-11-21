import 'package:flutter/material.dart';

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
        title: Text("gridview"),
      ),
      body: GridView.count(
        //水平子Widget之间间距
        crossAxisSpacing: 10.0,
        //垂直子Widget之间间距
        mainAxisSpacing: 30.0,
        //GridView内边距
        padding: EdgeInsets.all(10.0),
        //一行的Widget数量
        crossAxisCount: 2,
        //子Widget宽高比例
        childAspectRatio: 2.0,
        //子Widget列表
        children: getWidgetList(),
      ),
    );
  }
}

List<String> getDataList() {
  List<String> list = [];
  for (int i = 0; i < 100; i++) {
    list.add(i.toString());
  }
  return list;
}

List<Widget> getWidgetList() {
  return getDataList().map((item) => getItemContainer(item)).toList();
}

Widget getItemContainer(String item) {
  return Container(
    alignment: Alignment.center,
    child: Text(
      item,
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
    color: Colors.blue,
  );
}
