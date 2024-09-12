import 'package:flutter/material.dart';

const colorList = <Color>[
  Color.fromRGBO(80, 7, 120, 5),
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
      appBarTheme: const AppBarTheme(centerTitle: true),
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontFamily: 'Roboto'),
        bodySmall: TextStyle(fontFamily: 'Roboto'),
        bodyLarge: TextStyle(fontFamily: 'Roboto'),
        titleMedium: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.normal),
        titleLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 22,
          fontWeight: FontWeight.normal,
        ),
        titleSmall: TextStyle(fontFamily: 'Montserrat'),
      ));
}
