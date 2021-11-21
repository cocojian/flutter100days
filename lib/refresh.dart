import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 1;
  List data = [];

  GlobalKey<RefreshIndicatorState> _refreshIndicatorKey;

  @override
  void initState() {
    super.initState();

    _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
    // 进入页面立即显示刷新动画
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _refreshIndicatorKey.currentState?.show();
    });

    this._onRefresh();
  }

  //'${this.baseUrl}/topics?mdrender=false&limit=10&page=${this.page}'
  _fetchData() async {
    var baseUrl = Uri.parse(
        "https://cnodejs.org/api/v1/topics?mdrender=false&limit=10&page=${this.page}");
    var response = await http.get(baseUrl);
    var json = await jsonDecode(response.body);
    return json['data'];
  }

  Future<dynamic> _onRefresh() {
    data.clear();
    this.page = 1;
    return _fetchData().then((data) {
      setState(() => this.data.addAll(data));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('下拉刷新'),
          ),
          body: RefreshIndicator(
              // 在ListView外包一层 RefreshIndicator 组件
              onRefresh: _onRefresh, // 添加onRefresh方法
              child: ListView.separated(
                itemCount: this.data.length,
                itemBuilder: (context, index) {
                  var _data = this.data[index];
                  return ListTile(
                      leading: Image.network(_data["author"]["avatar_url"]),
                      title: Text(_data["title"]),
                      subtitle: Text(_data["author"]["loginname"] +
                          " created at " +
                          DateTime.now().toString()), // 为了看每次数据变动，这里直接取当前时间
                      trailing: Icon(Icons.chevron_right));
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ))),
    );
  }
}
