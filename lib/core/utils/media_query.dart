import 'dart:math';

import 'package:flutter/cupertino.dart';

class MediaQueryHelper {

  MediaQueryHelper._();

  static double height(BuildContext context, double factor) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height * factor * mediaQuery.textScaleFactor;
  }

  static double width(BuildContext context, double factor) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width * factor * mediaQuery.textScaleFactor;
  }

  static double responsiveWidthHeight(BuildContext context, double factor) {
    return max(height(context, factor), width(context, factor));
  }

  static double minWidthMaxHeight(BuildContext context, double factor) {
    return min(height(context, factor), width(context, factor));
  }
}