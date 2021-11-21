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
          title: Text("shape"),
        ),
        body: Column(
          children: [
            Card(
              shape: BeveledRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                  'https://ssyerv1.oss-cn-hangzhou.aliyuncs.com/picture/389e31d03d36465d8acd9939784df6f0.jpg!sswm',
                fit: BoxFit.cover,),
            ),
            Container(
              width: 220,
              height: 120,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://ssyerv1.oss-cn-hangzhou.aliyuncs.com/picture/389e31d03d36465d8acd9939784df6f0.jpg!sswm'),
                  fit: BoxFit.cover,
                ),
                shape: CircleBorder(
                  side: BorderSide(
                    width: 2,
                    color: Colors.blue,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
            Container(
              width: 220,
              height: 120,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://ssyerv1.oss-cn-hangzhou.aliyuncs.com/picture/389e31d03d36465d8acd9939784df6f0.jpg!sswm'),
                  fit: BoxFit.cover,
                ),
                shape: StadiumBorder(
                  side: BorderSide(
                    width: 2,
                    color: Colors.blue,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
            Container(
              width: 220,
              height: 120,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://ssyerv1.oss-cn-hangzhou.aliyuncs.com/picture/389e31d03d36465d8acd9939784df6f0.jpg!sswm'),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    width: 2,
                    color: Colors.blue,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),

          ],
        ));
  }
}