import 'package:flutter/material.dart';
import 'data/list.dart' as newsList;



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

  Widget _itemBuilderFunc(BuildContext context, int index) {
    final Map news = newsList.news[index];
    return ListItem(
      cover: news['imgurl'],
      title: news['title'],
      subTitle: news['time'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.news.length,
      itemBuilder: this._itemBuilderFunc,
      itemExtent: 90,
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
