import 'package:flutter/material.dart';



class MyLocationPage extends StatelessWidget {
  String title;

  MyLocationPage({Key key, this.title,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      color: Colors.greenAccent,
      child: Text(
          this.title,
        style: TextStyle(color: Colors.black, fontSize: 40.0),
      ),
    );
  }
}