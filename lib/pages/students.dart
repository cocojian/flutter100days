import 'package:flutter/material.dart';

class Students extends StatelessWidget {
  final String name;
  final int age;

  const Students({Key key, this.name,this.age}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: name,
      home: Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: Center(
          child: Column(
            children: [
              Text("name:$name  ---   age:$age"),
              ElevatedButton(
                child: Text("返回"),
                onPressed: () {
                  Navigator.of(context).pop("这是pop返回的参数值");
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
