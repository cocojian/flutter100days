import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

void showWarnToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void showSnackBar(BuildContext context, String text, {String subTitle: '关闭'}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: Colors.black54,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: subTitle,
        onPressed: () {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        },
      ),
      duration: Duration(seconds: 5),
      onVisible: () {
        print('显示');
      },
    ),
  );
}

Widget myTooltip(String s) {
  return Tooltip(
    message: s,
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(left: 100),
    verticalOffset: 10,
    // preferBelow: false,
    decoration: BoxDecoration(
        color: Colors.amber, borderRadius: BorderRadius.circular(10)),
    textStyle: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    showDuration: Duration(seconds: 5),
    child: Text(s),
  );
}

Future alertDialog(BuildContext context) async {
  var result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示信息"),
          content: Text("您确定要删除吗"),
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () {
                Navigator.pop(context, "cancel");
              },
            ),
            TextButton(
              child: Text("确定"),
              onPressed: () {
                Navigator.pop(context, "ok");
              },
            ),
          ],
        );
      });
  return result;
}

Future alertSimpleDialog(BuildContext context) async {
  var result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("提示"),
          children: <Widget>[
            TextButton(
              child: Text("Option1"),
              onPressed: () => Navigator.pop(context, "Option1"),
            ),
            TextButton(
              child: Text("Option2"),
              onPressed: () => Navigator.pop(context, "Option2"),
            ),
            TextButton(
              child: Text("Option3"),
              onPressed: () => Navigator.pop(context, "Option3"),
            ),
          ],
        );
      });
  return result;
}

Future modeBottomDialog(BuildContext context) async {
  var result = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            children: <Widget>[
              ListTile(
                  title: Text("分享到 QQ"),
                  onTap: () {
                    Navigator.pop(context, "分享到 QQ");
                  }),
              ListTile(
                  title: Text("分享到 微信 "),
                  onTap: () {
                    Navigator.pop(context, "分享到 微信");
                  }),
              ListTile(
                  title: Text("分享到 微博"),
                  onTap: () {
                    Navigator.pop(context, "分享到 微博");
                  }),
              ListTile(
                  title: Text("分享到 知乎"),
                  onTap: () {
                    Navigator.pop(context, "分享到 知乎");
                  }),
            ],
          ),
        );
      });
  return result;
}
