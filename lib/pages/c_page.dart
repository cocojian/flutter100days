import 'package:flutter/material.dart';

class CPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'CPage';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            children: [
              Text("CPage"),
              ElevatedButton(
                child: Text("返回"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
