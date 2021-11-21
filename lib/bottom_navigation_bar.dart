import 'package:flutter/material.dart';

void main() {
  runApp(BottomNavBar());
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0; //记录当前选择的是哪一个
  final List<Widget> _pages = [
    //装在页面
    HomePage(),
    BusinessPage(),
    MyLocationPage()
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
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
            currentIndex: _currentIndex,
            onTap: (int index) {
              //点击事件
              setState(() {
                //修改状态，会自动刷新Widget
                this._currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: '学习'),
              BottomNavigationBarItem(icon: Icon(Icons.golf_course), label: '课程'),
            ]),
      ),
    );
  }
}

//首页页面
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      color: Colors.redAccent,
      child: Text(
        '首页',
        style: TextStyle(color: Colors.black, fontSize: 40.0),
      ),
    );
  }
}

//商务页面
class BusinessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      color: Colors.redAccent,
      child: Text(
        '学习',
        style: TextStyle(color: Colors.black, fontSize: 40.0),
      ),
    );
  }
}

//定位页面
class MyLocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      color: Colors.redAccent,
      child: Text(
        '课程',
        style: TextStyle(color: Colors.black, fontSize: 40.0),
      ),
    );
  }
}
