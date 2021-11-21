import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getData().then((result) {
      print("接口返回的数据是:${result}");
    }).whenComplete(() {
      print("异步任务处理完成");
    });
    print("我是在请求数据后面的代码");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<Response> getData() async {
    String url = "http://v.juhe.cn/toutiao/index";
    String key = "4c52313fc9247e5b4176aed5ddd56ad7";
    String type = "keji";

    print("开始请求数据");
    Response response =
        await Dio().get(url, queryParameters: {"type": type, "key": key});

    print("请求完成");

    return response;
  }
}
