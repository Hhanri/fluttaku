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

}