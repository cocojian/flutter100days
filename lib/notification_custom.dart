import 'package:flutter/material.dart';

void main() => runApp(NotificationDemo());

class NotificationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationDemoState();
  }
}

class _NotificationDemoState extends State {
  String _notificationData = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotificationDemo',
      home: new Scaffold(
          appBar: AppBar(
            title: Text('NotificationDemo'),
          ),
          body: NotificationListener<MyNotification>(
            onNotification: (notification) {
              setState(() {
                _notificationData = notification.notificationStr;
              });
              return true;
            },
            child: Column(
              children: <Widget>[
                Text(_notificationData),
                Builder(
                  builder: (context) {
                    return Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          child: Text('发送通知'),
                          onPressed: () {
                            MyNotification('notification_data')
                                .dispatch(context);
                          }),
                    );
                  },
                )
              ],
            ),
          )),
    );
  }
}
class MyNotification extends Notification{
  String notificationStr;

  MyNotification(this.notificationStr);
}