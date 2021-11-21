import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/students.dart';

class JDrawer extends StatelessWidget {
  const JDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 150,
            child: UserAccountsDrawerHeader(
              //设置用户名
              accountName: Text('用户名'),
              //设置用户邮箱
              accountEmail: Text('xxxxxxx@qq.com'),
              //设置当前用户的头像
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/logo.jpg"),
              ),
              //设置当前用户的头像的大小
              currentAccountPictureSize: Size(50, 50),

              //回调事件
              onDetailsPressed: () {},
            ),
          ),
          ListTile(
            leading: Icon(Icons.wifi),
            title: Text('我是主标题'),
            subtitle: Text('我是副标题'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('我是主标题'),
            subtitle: Text('我是副标题'),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('我是主标题'),
            subtitle: Text('我是副标题'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Students(name: "jjj"),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('我是主标题'),
            subtitle: Text('我是副标题'),
          ),
        ],
      ),
    );
  }
}
