import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //根组件
    return MaterialApp(
      title: "myapp",
      //调试
//      /showSemanticsDebugger: true,
      home: Scaffold(
        appBar: AppBar(
          title: Text('登录页'),
        ),
        //键盘悬浮于界面之上
        resizeToAvoidBottomInset: false,
        body: HomePage(),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _left = 0.0;
  double _top = 0.0;
  double _width = 0.0;
  double _height = 0.0;
  GlobalKey _key = GlobalKey();
  TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer();
    _tapGestureRecognizer.onTap = myTap;
  }

  void myTap() {
    print('11');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: <Widget>[
        Container(
            color: Colors.white
        ),
        Container(
//          height: 300,
          padding: EdgeInsets.only(top: 60, left: 16, right: 16),
          margin: EdgeInsets.only(top: 120, left: 16, right: 16),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                maxLines: 1,
                maxLength: 30,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_iphone),
                    hintText: "请输入手机号",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
              ),
              TextField(
                keyboardType: TextInputType.phone,
                maxLines: 1,
                maxLength: 30,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    hintText: "请输密码",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[Text('忘记密码?')],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CupertinoButton(
                    child: Text('登  录'),
                    onPressed: () {},
                    color: Colors.blue,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('验证码登录'),
                    Container(
                      height: 12,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: VerticalDivider(
                        width: 2.0,
                        color: Colors.blue,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text('新用户主注册'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                    value: true,
                    onChanged: (v) {},
                  ),
                  Text.rich(TextSpan(
                      text: '我已经阅读并同意遵守',
                      style: TextStyle(color: Colors.grey[400]),
                      children: [
                        TextSpan(
                            recognizer: _tapGestureRecognizer,
                            text: '《服务许可协议》',
                            style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.underline))
                      ]))
                ],
              ),

            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 50),

          child: Column(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                child: Image.asset("assets/images/logo.jpg"),

              ),
              SizedBox(
                height: 10,
              ),
              Text('登 录',style: TextStyle(
                fontSize: 20
              ),)
            ],
          ),
        )
      ],
    );
  }
}
