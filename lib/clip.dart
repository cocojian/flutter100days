import 'package:flutter/material.dart';
import '/widgets/coupon_shape_border.dart';

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
          title: Text("ClipRect"),
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              child: Image.network(
                  'https://ssyerv1.oss-cn-hangzhou.aliyuncs.com/picture/389e31d03d36465d8acd9939784df6f0.jpg!sswm'),
            ),
            ClipRect(
              child: Container(
                height: 100,
                width: 100,
                child: Image.network(
                  'https://ssyerv1.oss-cn-hangzhou.aliyuncs.com/picture/389e31d03d36465d8acd9939784df6f0.jpg!sswm',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                height: 100,
                width: 200,
                child: Image.network(
                  'https://ssyerv1.oss-cn-hangzhou.aliyuncs.com/picture/389e31d03d36465d8acd9939784df6f0.jpg!sswm',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ClipOval(
              child: Container(
                height: 100,
                width: 100,
                child: Image.network(
                  'https://ssyerv1.oss-cn-hangzhou.aliyuncs.com/picture/389e31d03d36465d8acd9939784df6f0.jpg!sswm',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ClipPath.shape(
              shape: CouponShapeBorder(),
              child: Container(
                height: 100,
                width: 200,
                child: Image.network(
                  'https://ssyerv1.oss-cn-hangzhou.aliyuncs.com/picture/389e31d03d36465d8acd9939784df6f0.jpg!sswm',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ClipPath(
              clipper: TrianglePath(),
              child: Container(
                height: 100,
                width: 100,
                child: Image.network(
                  'https://ssyerv1.oss-cn-hangzhou.aliyuncs.com/picture/389e31d03d36465d8acd9939784df6f0.jpg!sswm',
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ));
  }
}

class TrianglePath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width/2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}