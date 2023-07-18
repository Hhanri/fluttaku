import 'package:flutter/material.dart';


class MyTheme {

  MyTheme._();

  static final data = ThemeData(
    scaffoldBackgroundColor: MyColors.backgroundColor,
    useMaterial3: true,
    colorSchemeSeed: MyColors.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: MyColors.foregroundColor,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: MyColors.foregroundColor,
      surfaceTintColor: MyColors.foregroundColor,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected
    )
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
  static const defaultAsymmetricPadding = EdgeInsets.only(left: 18, right: 18, bottom: 18);

  static const smallPadding = EdgeInsets.all(12);
  static const bigPadding = EdgeInsets.all(32);

  static const tinyPadding = EdgeInsets.all(6);

  static final defaultBorderRadius = BorderRadius.circular(defaultRadiusValue);

  static const double defaultRadiusValue = 12;

  static final bigBorderRadius = BorderRadius.circular(36);

}

class MyColors {

  MyColors._();

  static const primaryColor = Colors.pinkAccent;
  static final backgroundColor = Colors.grey.shade100;
  static const foregroundColor = Colors.white;

  static const blackText = Colors.black87;

}

class MyTextStyle {

  MyTextStyle._();

  static const titleStyle = TextStyle(
    fontSize: 14,
    color: MyColors.blackText
  );

  static const titleBoldStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: MyColors.blackText
  );

  static const primaryBoldText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w800,
    color: MyColors.primaryColor,
    fontStyle: FontStyle.italic
  );

  static const ratingStyle = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w800
  );

  static const sectionTitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: MyColors.blackText
  );

  static const bodyStyle = TextStyle(
    fontSize: 14,
    color: MyColors.blackText
  );

  static const bodyBoldStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: MyColors.blackText
  );

}