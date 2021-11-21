import 'package:flutter/material.dart';

class APage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'APage';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            children: [
              Text("APage"),
              ElevatedButton(
                child: Text("返回"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: Text("BPage"),
                onPressed: () {
                  Navigator.of(context).pushNamed("/BPage");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
