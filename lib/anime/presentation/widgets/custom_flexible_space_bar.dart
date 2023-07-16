import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:fluttaku/core/config/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomFlexibleSpaceBar extends StatefulWidget {

  final Widget title;
  final Widget display;
  final Widget? background;
  final CollapseMode collapseMode;
  final List<StretchMode> stretchModes;
  final double maxDisplayHeight;
  const CustomFlexibleSpaceBar({
    Key? key,
    required this.title,
    required this.display,
    this.background,
    this.collapseMode = CollapseMode.parallax,
    this.stretchModes = const <StretchMode>[StretchMode.zoomBackground],
    required this.maxDisplayHeight,
  }) : super(key: key);

  @override
  State<CustomFlexibleSpaceBar> createState() => _CustomFlexibleSpaceBarState();
}

class _CustomFlexibleSpaceBarState extends State<CustomFlexibleSpaceBar> {

  double _getCollapsePadding(double t, FlexibleSpaceBarSettings settings) {
    switch (widget.collapseMode) {
      case CollapseMode.pin:
        return -(settings.maxExtent - settings.currentExtent);
      case CollapseMode.none:
        return 0.0;
      case CollapseMode.parallax:
        final double deltaExtent = settings.maxExtent - settings.minExtent;
        return -Tween<double>(begin: 0.0, end: deltaExtent / 4.0).transform(t);
    }
  }

  late final PageController _pageController;
  late final PageView pageView;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
    pageView = PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: kToolbarHeight,
            width: double.maxFinite,
            color: Colors.white,
            padding: MyTheme.defaultPadding,
            child: DefaultTextStyle(
              style: MyTextStyle.titleBoldStyle,
              child: widget.title,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: widget.maxDisplayHeight,
            child: widget.display
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final FlexibleSpaceBarSettings? settings = context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
        assert(
          settings != null,
          'A FlexibleSpaceBar must be wrapped in the widget returned by FlexibleSpaceBar.createSettings().',
        );

        if (_pageController.hasClients) {
          if (constraints.maxHeight <= widget.maxDisplayHeight) {
            _pageController.animateToPage(0, duration: const Duration(milliseconds: 50), curve: Curves.easeInOut);
          } else {
            _pageController.animateToPage(1, duration: const Duration(milliseconds: 50), curve: Curves.easeInOut);
          }
        }

        final List<Widget> children = <Widget>[];
        final double deltaExtent = settings!.maxExtent - settings.minExtent;
        final double t = clampDouble(1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent, 0.0, 1.0);

        //BACKGROUND
        if (widget.background != null) {
          final double fadeStart = math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
          const double fadeEnd = 1.0;
          assert(fadeStart <= fadeEnd);
          // If the min and max extent are the same, the app bar cannot collapse
          // and the content should be visible, so opacity = 1.
          final double opacity = settings.maxExtent == settings.minExtent
              ? 1.0
              : 1.0 - Interval(fadeStart, fadeEnd).transform(t);
          double height = settings.maxExtent;

          // StretchMode.zoomBackground
          if (
            widget.stretchModes.contains(StretchMode.zoomBackground)
            && constraints.maxHeight > height
          ) {
            height = constraints.maxHeight;
          }
          children.add(Positioned(
            top: _getCollapsePadding(t, settings),
            left: 0.0,
            right: 0.0,
            height: height,
            child: Opacity(
              // IOS is relying on this semantics node to correctly traverse
              // through the app bar when it is collapsed.
              alwaysIncludeSemantics: true,
              opacity: opacity,
              child: widget.background,
            ),
          ));

          // StretchMode.blurBackground
          if (widget.stretchModes.contains(StretchMode.blurBackground) &&
              constraints.maxHeight > settings.maxExtent) {
            final double blurAmount = (constraints.maxHeight - settings.maxExtent) / 10;
            children.add(Positioned.fill(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(
                  sigmaX: blurAmount,
                  sigmaY: blurAmount,
                ),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ));
          }
        }

        children.add(pageView);

        return ClipRect(
          child: Stack(
            children: children
          )
        );
      }
    );
  }
}
