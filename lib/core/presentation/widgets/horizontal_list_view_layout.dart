import 'package:fluttaku/core/config/theme.dart';
import 'package:flutter/material.dart';

class HorizontalListViewLayout extends StatelessWidget {
  final String title;
  final double height;
  final Widget listView;
  const HorizontalListViewLayout({Key? key, required this.title, required this.height, required this.listView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: MyTheme.defaultPadding,
          child: Text(
            title,
            style: MyTextStyle.sectionTitleStyle,
          ),
        ),
        SizedBox(
          height: height,
          child: listView,
        )
      ],
    );
  }
}
