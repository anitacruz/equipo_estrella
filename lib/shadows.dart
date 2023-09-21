import 'package:flutter/material.dart';
import 'colors.dart';

//TODO: try to modularize
class ManosShadows {
  static BoxDecoration shadow1 = BoxDecoration(
    borderRadius: BorderRadius.circular(16.0),
    color: ManosColors
        .neutral10, // You can use the specific color code or a variable if defined.
    boxShadow: const [
      BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 3,
        spreadRadius: 1,
        color: Color.fromRGBO(0, 0, 0, 0.15),
      ),
      BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 2,
        spreadRadius: 0,
        color: Color.fromRGBO(0, 0, 0, 0.30),
      ),
    ],
  );
  // Your widget content here

  static BoxDecoration shadow2 = BoxDecoration(
    borderRadius: BorderRadius.circular(16.0),
    color: ManosColors
        .neutral10, // You can use the specific color code or a variable if defined.
    boxShadow: const [
      BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 6,
        spreadRadius: 2,
        color: Color.fromRGBO(0, 0, 0, 0.15),
      ),
      BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 2,
        spreadRadius: 0,
        color: Color.fromRGBO(0, 0, 0, 0.30),
      ),
    ],
  );

  static BoxDecoration shadow3 = BoxDecoration(
    borderRadius: BorderRadius.circular(16.0),
    color: ManosColors
        .neutral10, // You can use the specific color code or a variable if defined.
    boxShadow: const [
      BoxShadow(
        offset: Offset(0, 4),
        blurRadius: 4,
        spreadRadius: 0,
        color: Color.fromRGBO(0, 0, 0, 0.30),
      ),
      BoxShadow(
        offset: Offset(0, 8),
        blurRadius: 12,
        spreadRadius: 6,
        color: Color.fromRGBO(0, 0, 0, 0.15),
      ),
    ],
  );

}
