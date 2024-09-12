import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.yellow,
  Colors.pink,
  Colors.green,
];

class AppTheme {
  final int selectecColor;

  AppTheme({this.selectecColor = 0})
      : assert(selectecColor >= 0, 'selected colors must bve greater then 0'),
        assert(selectecColor < colorList.length,
            'selected colors must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectecColor],
      appBarTheme: AppBarTheme(centerTitle: true));
}
