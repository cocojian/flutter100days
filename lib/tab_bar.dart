import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "TabBarWidget",
    home: MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this,length: 6);
    this._tabController.addListener(() {
      print(this._tabController.toString());
      print(this._tabController.index);
      print(this._tabController.length);
      print(this._tabController.previousIndex);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("顶部Tab切换"),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(text: "热门",icon: Icon(Icons.directions_car)),
            Tab(text: "推荐"),
            Tab(text: "关注"),
            Tab(text: "收藏"),
            Tab(text: "新增"),
            Tab(text: "点赞"),
          ],
          controller: _tabController,  // 记得要带上tabController
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
              child: Text("这是热门的内容")
          ),
          Center(
              child: Text("这是推荐的内容")
          ),
          Center(
              child: Text("这是关注的内容")
          ),
          Center(
              child: Text("这是收藏的内容")
          ),
          Center(
              child: Text("这是新增的内容")
          ),
          Center(
              child: Text("这是点赞的内容")
          )
        ],
      ),
    );
  }
}