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
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
    // 进入页面立即显示刷新动画
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _refreshIndicatorKey.currentState?.show();
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _onLoadMore();
      }
    });
    this._onRefresh();
  }

  Future<dynamic> _onLoadMore() {
    this.page++;
    return _fetchData().then((data) {
      setState(() {
        this.data.addAll(data);
      });
    });
  }


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

  Widget _loadMoreWidget() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
            controller: _scrollController,
            itemCount: this.data.length,
            itemBuilder: (context, index) {
              if (index == data.length - 1) {
                return _loadMoreWidget();
              } else {
                var _data = this.data[index];
                return ListTile(
                    leading: Image.network(_data["author"]["avatar_url"]),
                    title: Text(_data["title"]),
                    subtitle: Text(_data["author"]["loginname"] +
                        " created at " +
                        DateTime.now().toString()), // 为了看每次数据变动，这里直接取当前时间
                    trailing: Icon(Icons.chevron_right));
              }
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
        ),
      ),
    );
  }
}
