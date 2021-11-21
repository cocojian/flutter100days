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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              stretch: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('开学季'),
                background: Image.network(
                  "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(top: 10),),
            SliverGrid(
              //调整间距
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 10,
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 10,
                  childAspectRatio: 4.0
              ),
              //加载内容
              delegate: SliverChildBuilderDelegate(
                    (context,index) {
                  return Container( //设置每个item的内容
                    alignment: Alignment.center,
                    color: Colors.orangeAccent,
                    child: Text("$index"),
                  );
                },
                childCount: 20, //设置个数
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(top: 10),),
            SliverFixedExtentList(
              itemExtent: 50,
              //加载内容
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.deepPurpleAccent,
                    child: Text('$index'),
                  );
                },
                //设置显示个数
                childCount: 20,
              ),
            )
          ],
        )
      ),
    );
  }
}
