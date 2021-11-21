import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DatePickerPubDemo extends StatefulWidget {
  DatePickerPubDemo({Key key}) : super(key: key);

  _DatePickerPubDemoState createState() => _DatePickerPubDemoState();
}

class _DatePickerPubDemoState extends State<DatePickerPubDemo> {
  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2018, 3, 5),
      maxTime: DateTime(2028, 6, 7),
      onChanged: (date) {
        //print('change $date');
      },
      onConfirm: (date) {
        //print('confirm $date');
        setState(() {
          this._dateTime = date;
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.zh,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("日期选择"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                  child: Row(
                    children: <Widget>[
                      Text(
                          "${formatDate(_dateTime, [yyyy, '-', mm, '-', dd])}"),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: _showDatePicker),
            ],
          ),
        ],
      ),
    );
  }
}
