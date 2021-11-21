import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '新闻列表',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '新闻列表'),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: _getNews(),
          builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
            /*表示数据成功返回*/
            if (snapshot.hasData) {
              Response response = snapshot.data;
              return Text("${response.data.toString()}");
            } else {
              return Center(
                  child: SpinKitFadingCircle(
                color: Colors.blue,
                size: 25.0,
              ));
            }
          },
        ));
  }
}

/**
 * 请求接口获取数据
 */
Future<Response> _getNews() async {
  await Future.delayed(Duration(seconds: 3), () {
    print("延时三秒后请求数据");
  });

  String url = "http://v.juhe.cn/toutiao/index";
  String key = "4c52313fc9247e5b4176aed5ddd56ad7";
  String type = "keji";

  print("开始请求数据");
  Response response =
      await Dio().get(url, queryParameters: {"type": type, "key": key});

  print("请求完成");

  return response;
}
