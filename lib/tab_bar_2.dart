import 'package:flutter/material.dart';
import '/tabs/tabs_his.dart';
import '/tabs/tabs_pic.dart';
import '/tabs/tabs_news.dart';

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

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];
  int index = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
    this._tabController.addListener(() {
      index = this._tabController.index;
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
        title: Text("顶部Tab切换2"),
        bottom: TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          TabsNews(index: this.index,title: tabs[this.index],),
          TabsHis(index: this.index,title: tabs[this.index],),
          TabsPic(index: this.index,title: tabs[this.index],),
        ],
      ),
    );
  }
}
