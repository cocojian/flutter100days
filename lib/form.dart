import 'package:flutter/material.dart';
import 'tool/shared_preferences_utils.dart';
import 'pages/index_page.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  String _userName = "";
  String _password = "";

  void _login(BuildContext context) {
    var _loginForm = _loginKey.currentState;
    if (_loginForm.validate()) {
      _loginForm.save();
     // SharedPreferencesUtils.clear();
      SharedPreferencesUtils.savePreference('username', _userName);
      SharedPreferencesUtils.savePreference('password', _password);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => IndexPage(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                        key: _loginKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: '请输入用户名',
                              ),
                              onSaved: (value) {
                                _userName = value;
                              },
                              validator: (value) {
                                return value.trim().length < 6
                                    ? '用户名长度不够6位'
                                    : null;
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: '请输入密码',
                              ),
                              obscureText: true,
                              onSaved: (value) {
                                _password = value;
                              },
                              validator: (value) {
                                return value.trim().length < 6
                                    ? '密码长度不够6位'
                                    : null;
                              },
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20.0),
                              width: 400.0,
                              height: 40.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  _login(context);
                                },
                                child: Text('登录'),
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
