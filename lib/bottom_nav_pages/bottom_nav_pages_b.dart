import 'package:flutter/material.dart';



class BusinessPage extends StatelessWidget {
  String title;

  BusinessPage({Key key, this.title,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      color: Colors.blueAccent,
      child: Text(
        this.title,
        style: TextStyle(color: Colors.black, fontSize: 40.0),
      ),
    );
  }
}