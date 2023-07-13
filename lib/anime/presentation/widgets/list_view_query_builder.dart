import 'package:fluttaku/core/presentation/base_query_cubit/base_query_cubit.dart';
import 'package:fluttaku/core/presentation/widgets/query_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewQueryBuilder<I> extends QueryBuilder<I> {
  final Widget Function(BuildContext context, I item) itemBuilder;
  final bool shrinkWrap;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final Axis scrollDirection;
  ListViewQueryBuilder({
    super.key,
    required this.itemBuilder,
    this.shrinkWrap = false,
    this.padding,
    this.physics,
    this.scrollDirection = Axis.vertical
  }) : super(
    builder: (context, state) {
      return ListView.builder(
        shrinkWrap: shrinkWrap,
        padding: padding,
        physics: physics,
        scrollDirection: scrollDirection,
        itemCount: state.result.items.length,
        itemBuilder: (context, index) {
          if (state.isLastItem(index) && state.hasMore) context.read<BaseQueryCubit<I>>().fetch();

          final doc = state.result.items[index];
          return itemBuilder(context, doc);
        }
      );
    }
  );
}