import 'package:flutter/material.dart';



class PersonPage extends StatelessWidget {
  String title;

  PersonPage({Key key, this.title,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      color: Colors.black38,
      child: Text(
          this.title,
        style: TextStyle(color: Colors.black, fontSize: 40.0),
      ),
    );
  }
}