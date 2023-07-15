import 'package:flutter/material.dart';


class MyTheme {

  MyTheme._();

  static final data = ThemeData(
    scaffoldBackgroundColor: MyColors.backgroundColor,
    useMaterial3: true,
    colorSchemeSeed: MyColors.primaryColor
  );

  static const boxShadow = [
    BoxShadow(
      color: Colors.black26,
      spreadRadius: 0.05,
      blurRadius: 8
    )
  ];

  static const defaultPadding = EdgeInsets.all(18);
  static const defaultHorizontalPadding = EdgeInsets.symmetric(horizontal: 18);
  static const defaultAsymmetricPadding = EdgeInsets.only(left: 18, right: 18, bottom: 12);

  static const smallPadding = EdgeInsets.all(12);

  static final defaultBorderRadius = BorderRadius.circular(defaultRadiusValue);

  static const double defaultRadiusValue = 12;

  static final bigBorderRadius = BorderRadius.circular(36);

}

class MyColors {

  MyColors._();

  static const primaryColor = Colors.pinkAccent;
  static final backgroundColor = Colors.grey.shade100;

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