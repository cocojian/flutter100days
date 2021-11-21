import 'package:flutter/material.dart';
import 'data/list.dart' as newsList;

const TITLE = '标题标题标题标题标题标题标题';
const SUB_TITLE = '二级标题二级标题二级标题二级标题二级标题二级标题二级标题二级标题二';
const IMAGE_SRC =
    'https://cdn.pixabay.com/photo/2019/05/20/13/22/portugal-4216645_1280.jpg';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView Widget'),
          backgroundColor: Colors.pink,
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListViewDemo(),
    );
  }
}

class ListViewDemo extends StatelessWidget {
  // 读取文件 mock 数据
  List<Widget> _getNewsList() {
    return newsList.news.map((item) {
      return ListItem(
        title: '${item['title']}',
        subTitle: '${item['time']}',
        cover: '${item['imgurl']}',
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getNewsList(),
    );
  }
}

class ListItem extends StatelessWidget {
  ListItem({this.title, this.subTitle, this.cover});
  final String title;
  final String subTitle;
  final String cover;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          child: Image.network(this.cover, fit: BoxFit.cover),
          width: 60,
          height: 60,
          color: Colors.grey),
      trailing: Icon(Icons.chevron_right),
      title: Text(this.title),
      subtitle: Text(this.subTitle),
    );
  }
}
