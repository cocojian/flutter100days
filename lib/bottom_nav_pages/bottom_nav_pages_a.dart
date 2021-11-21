import 'package:flutter/material.dart';
import '../tool/shared_preferences_utils.dart';

class HomePage extends StatefulWidget {
  String title;

  HomePage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    getUername();
    getPassword();
    return Container(
      alignment: Alignment.center,
      // color: Colors.redAccent,
      child: Column(
        children: [
          Text(
            this.username != null ? "用户名：${this.username}" : "",
            style: TextStyle(color: Colors.black, fontSize: 40.0),
          ),
          Text(
            this.password != null ? "密  码：${this.password}" : "",
            style: TextStyle(color: Colors.black, fontSize: 40.0),
          ),
        ],
      ),
    );
  }

  getUername() {
    SharedPreferencesUtils.get("username").then((value) {
      setState(() {
        this.username = value;
      });
    });
  }
  getPassword() {
    SharedPreferencesUtils.get("password").then((value) {
      setState(() {
        this.password = value;
      });
    });
  }
}
