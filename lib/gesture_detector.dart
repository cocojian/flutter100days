import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'widgets/j_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = 'GestureDetector';
    return MaterialApp(
      title: appName,
      home:  ScaleGestureDetector(
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
      body: GestureDetector(
        onTap: () => print("点击"),
        onDoubleTap: () => print("双击"),
        onLongPress: () => print("长按"),
        onTapCancel: () => print("取消"),
        onTapUp: (e) => print("松开"),
        onTapDown: (e) => print("按下"),
        child: Container(
          decoration: BoxDecoration(color: Colors.redAccent),
          width: 100,
          height: 100,
        ),
      )
    );
  }
}

class Draggle extends StatefulWidget {
  final String title;

  const Draggle({Key key, this.title}) : super(key: key);

  @override
  _DraggleState createState() => _DraggleState();
}

class _DraggleState extends State<Draggle> {
  double top =0;
  double left =0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: GestureDetector(
            onPanDown: (DragDownDetails e) {
              //打印手指按下的位置
              print("手指按下：${e.globalPosition}");
            },
            //手指滑动
            onPanUpdate: (DragUpdateDetails e) {
              setState(() {
                left += e.delta.dx;
                top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e) {
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },

            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(36)
              ),
            ),
          ),
        )
      ],
    );
  }
}


class ScaleGestureDetector extends StatefulWidget {
  final String title;

  const ScaleGestureDetector({Key key, this.title}) : super(key: key);

  @override
  _ScaleGestureDetectorState createState() => _ScaleGestureDetectorState();
}

class _ScaleGestureDetectorState extends State<ScaleGestureDetector> {
  double width=200;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          //使用OverflowBox可以让子组件宽高超过父组件
          child: OverflowBox(
            maxWidth: 2000.0,
            child: Image.network(
                "https://upload-images.jianshu.io/upload_images/10992781-a64bd14d27699266.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp",
                width: width),
          ),
        ),
        onScaleUpdate: (ScaleUpdateDetails e) {
          setState(() {
            //缩放倍数在0.8到10倍之间
            width = 200 * e.scale.clamp(0.8, 10);
          });
        },
      ),
    );
  }
}


