import 'package:flutter/material.dart';

void main() {
  runApp(SwitchAndCheckboxApp());
}

// SwitchAndCheckboxApp
class SwitchAndCheckboxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "单选开关和复选框",
        home: Scaffold(
          appBar: AppBar(
            title: Text("单选开关和复选框"),
          ),
          body: new SwitchAndCheckBoxTestRoute(),
        ));
  }
}

// SwitchAndCheckBoxTestRoute
class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      new _SwitchAndCheckBoxTestRouteState();
}

// _SwitchAndCheckBoxTestRouteState
class _SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckBoxTestRoute> {
  int _sex = 1;
  int _status = 2;
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text('性别'),
            Radio(
              value: 1,
              onChanged: (value) {
                setState(() {
                  this._sex = value;
                });
              },
              groupValue: this._sex,
            ),
            Text('男'),
            Radio(
              value: 2,
              onChanged: (value) {
                setState(() {
                  this._sex = value;
                });
              },
              groupValue: this._sex,
            ),
            Text('女'),
          ],
        ),
        // 组合选择项1
        RadioListTile(
          value: 1,
          groupValue: this._status,
          onChanged: (value) {
            setState(() {
              this._status = value;
            });
          },
          title: Text("标题"),
          subtitle: Text("这是二级标题"),
          secondary: Icon(Icons.help),
          selected: this._status == 1,
        ),

        // 组合选择项2
        RadioListTile(
          value: 2,
          groupValue: this._status,
          onChanged: (value) {
            setState(() {
              this._status = value;
            });
          },
          title: Text("标题"),
          subtitle: Text("这是二级标题"),
          secondary:
              Image.network('https://www.itying.com/images/flutter/1.png'),
          selected: this._status == 2,
        ),

        Switch(
          value: _switchSelected, //当前状态
          onChanged: (newValue) {
            //重新构建页面
            setState(() {
              _switchSelected = newValue;
            });
          },
        ),
        SwitchListTile(
          value: _switchSelected, //当前状态
          title: Text("性别"),
          subtitle: Text("请输入男或者女"),
          secondary: Icon(Icons.person_add),
          onChanged: (newValue) {
            //重新构建页面
            setState(() {
              _switchSelected = newValue;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red, //选中时的颜色
          onChanged: (newValue) {
            setState(() {
              _checkboxSelected = newValue;
            });
          },
        ),
        CheckboxListTile(
          value: _checkboxSelected,
          activeColor: Colors.red, //选中时的颜色
          title: Text("标题"),
          subtitle: Text("这是副标题"),
          secondary: Icon(Icons.help),
          selected: this._checkboxSelected,
          checkColor: Colors.blue,
          onChanged: (newValue) {
            setState(() {
              _checkboxSelected = newValue;
            });
          },
        ),
      ],
    );
  }
}
