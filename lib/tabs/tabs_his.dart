import 'package:flutter/material.dart';
import '../data/list.dart' as newsList;

class TabsHis extends StatelessWidget {
  final int index;
  final String title;

  const TabsHis({Key key, this.index, this.title}) : super(key: key);


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
    print(this.index);
    print(this.title);
    return Center(
      child: ListView.builder(
        itemCount: newsList.news.length,
        itemBuilder: this._itemBuilderFunc,
        itemExtent: 90,
      ),
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
