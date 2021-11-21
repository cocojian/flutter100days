import 'package:flutter/material.dart';

class BPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'BPage';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            children: [
              Text("BPage"),
              ElevatedButton(
                child: Text("返回"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: Text("CPage"),
                onPressed: () {
                  Navigator.of(context).pushNamed("/CPage");
                 // Navigator.of(context).pushReplacementNamed("/CPage");
                  //Navigator.of(context).pushNamedAndRemoveUntil("/CPage", ModalRoute.withName("/"));
                  //Navigator.pushNamed("/CPage");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}