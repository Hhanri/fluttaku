import 'package:flutter/material.dart';


class MyTheme {

  MyTheme._();

  static const boxShadow = [
    BoxShadow(
      color: Colors.black26,
      spreadRadius: 0.05,
      blurRadius: 8
    )
  ];

  static const defaultPadding = EdgeInsets.all(12);

  static final defaultBorderRadius = BorderRadius.circular(radiusValue);

  static const double radiusValue = 12;

}

class MyTextStyle {

  MyTextStyle._();

  static const titleStyle = TextStyle(
    fontSize: 14
  );

  static const titleBoldStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800
  );

  static const ratingStyle = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w700
  );

  static const sectionTitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800
  );

  static const bodyStyle = TextStyle(
    fontSize: 14,
  );

  static const bodyBoldStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500
  );

}