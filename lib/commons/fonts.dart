import 'package:flutter/material.dart';

class ManosFonts {
  static TextStyle h1({Color color = Colors.black}) => TextStyle(
      fontFamily: 'Roboto',
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.18);

  static TextStyle h2(Color neutral0, {Color color = Colors.black}) => TextStyle(
      fontFamily: 'Roboto',
      color: color,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15);

  static TextStyle sub1({Color color = Colors.black}) => TextStyle(
      fontFamily: 'Roboto',
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15);

  static TextStyle b1({Color color = Colors.black}) => TextStyle(
      fontFamily: 'Roboto',
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);

  static TextStyle b2({Color color = Colors.black}) => TextStyle(
      fontFamily: 'Roboto',
      color: color,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4);

  static TextStyle button({Color color = Colors.black}) => TextStyle(
      fontFamily: 'Roboto',
      color: color,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1);

  static TextStyle caption({Color color = Colors.black}) => TextStyle(
      fontFamily: 'Roboto',
      color: color,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4);

  static TextStyle overline({Color color = Colors.black}) => TextStyle(
      fontFamily: 'Roboto',
      color: color,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5);
}
