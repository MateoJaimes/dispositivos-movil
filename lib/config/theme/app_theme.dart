import 'package:flutter/material.dart';

const colorLis = <Color>[
  Color(0xFFB71C1C),
  Color(0xFFF57F17),
  Color(0xFF1B5E20),
  Color(0xFF0D47A1),
  Color(0xFF4A148C),
  Color(0xFF004D40),
  Color(0xFF3E2723),
];

class AppTheme {
  final int selectColor;
  final bool dart;

  AppTheme({this.dart = true, this.selectColor = 0});

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorLis[selectColor],
    brightness: dart ? Brightness.dark : Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: colorLis[selectColor],
      centerTitle: true,
    ),
  );
}
