import 'package:flutter/material.dart';
import '../tool/config.dart';
import '../bottom_nav_pages/bottom_nav_pages_a.dart';
import '../bottom_nav_pages/bottom_nav_pages_b.dart';
import '../bottom_nav_pages/bottom_nav_pages_c.dart';
import '../bottom_nav_pages/bottom_nav_pages_d.dart';
import '../tool/shared_preferences_utils.dart';


class IndexPage extends StatefulWidget {
  const IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 0; //记录当前选择的是哪一个
  String title = '首页';

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomePage(
        title: this.title,
      ),
      BusinessPage(
        title: this.title,
      ),
      MyLocationPage(
        title: this.title,
      ),
      PersonPage(
        title: this.title,
      )
    ];
    return  Scaffold(
        appBar: AppBar(
          title: Text('底部导航'),
        ),
        body: _pages[_currentIndex], //展示组件
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.redAccent,
//        unselectedLabelStyle: TextStyle(color: Colors.orange),
            unselectedItemColor: Colors.grey,
//        selectedItemColor: Colors.orange,
            currentIndex: this._currentIndex,
            onTap: (int index) {
              //点击事件
              setState(() {
                //修改状态，会自动刷新Widget
                this._currentIndex = index;
                this.title = bottomNavBarList[this._currentIndex]['title'];
              });
            },
            items: bottomNavBarList
                .map((e) => BottomNavigationBarItem(
                icon: Icon(e['icon']), label: e['title']))
                .toList()),
      );

  }
}
