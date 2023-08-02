import 'package:flutter/material.dart';

class MySeparatedListView<I> extends StatelessWidget {
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final bool shrinkWrap;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final Axis scrollDirection;
  final bool reverse;
  final Clip clipBehavior;
  const MySeparatedListView({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.shrinkWrap = false,
    this.padding,
    this.physics,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.clipBehavior = Clip.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: shrinkWrap,
      padding: padding,
      physics: physics,
      scrollDirection: scrollDirection,
      reverse: reverse,
      clipBehavior: clipBehavior,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      separatorBuilder: (context, index) {
        switch(scrollDirection) {
          case Axis.vertical: return const SizedBox.shrink();
          case Axis.horizontal: return const SizedBox(width: 8,) ;
        }
      },
    );
  }
}
