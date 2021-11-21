import 'package:flutter/material.dart';

class AppTheme {
  // 1.抽取相同的样式
  static const double _titleFontSize = 20;
  final ThemeData theme = ThemeData();
  // 2.亮色主题
  static final ThemeData lightTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primarySwatch: Colors.green,
    fontFamily: 'Georgia',
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );

  // 3.暗黑主题
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Georgia',
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}
