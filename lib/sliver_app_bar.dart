import 'package:flutter/material.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController;
  VoidCallback onChange;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    onChange = () {
      print('onChange');
    };
    _scrollController.addListener(onChange);
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

        body: new CustomScrollView(
          //滚动方向
          scrollDirection: Axis.vertical,
          //是否反转滚动方向
          reverse: false,
          //监听事件等等控制器
          controller: _scrollController,
          //true 的话 controller 一定要为null
          primary: false,
          //滑动效果，如阻尼效果等等
          physics: const BouncingScrollPhysics(),
          //滑动控件是否在头部上面滑过去
          shrinkWrap: false,
          //0到1之间，到顶部的距离
          anchor: 0.0,
          //“预加载”的区域,0.0 为关闭预加载
          cacheExtent: 0.0,
          slivers: <Widget>[
            SliverAppBar(
              elevation: 5,
              forceElevated: true,
              expandedHeight: 250.0,
              //stretch: true,
              floating: true,
              snap: true,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('SliverAppBar'),
                background: Image.network(
                  'https://cn.bing.com/th?id=OIP.xq1C2fmnSw5DEoRMC86vJwD6D6&pid=Api&rs=1',
                  fit: BoxFit.fill,
                ),
                //标题是否居中
                centerTitle: true,
                //标题间距
                titlePadding: EdgeInsetsDirectional.only(start: 0, bottom: 16),
                collapseMode: CollapseMode.none,
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 80.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.primaries[(index % 18)],
                      child: Text(''),
                    ),
                  );
                },
              ),
            ),
          ],
          semanticChildCount: 6, //可见子元素的总数
        ),
      ),
    );
  }
}
