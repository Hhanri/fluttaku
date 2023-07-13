import 'package:fluttaku/core/interfaces/search_result_interface.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_query_cubit.dart';
import 'package:fluttaku/core/presentation/widgets/query_builder.dart';
import 'package:fluttaku/core/use_cases/use_case.dart';
import 'package:fluttaku/core/utils/anime_query_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewQueryBuilder<
  C extends BaseQueryCubit<U, I>,
  U extends UseCase<SearchResultInterface<I>, QueryParams>,
  I
> extends QueryBuilder<C, U, I> {
  final Widget Function(BuildContext context, I item) itemBuilder;
  final bool shrinkWrap;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final Axis scrollDirection;
  final bool reverse;
  final Clip clipBehavior;

  ListViewQueryBuilder({
    super.key,
    required this.itemBuilder,
    this.shrinkWrap = false,
    this.padding,
    this.physics,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.clipBehavior = Clip.hardEdge,
  }) : super(
    builder: (context, state) {
      return ListView.builder(
        shrinkWrap: shrinkWrap,
        padding: padding,
        physics: physics,
        scrollDirection: scrollDirection,
        reverse: reverse,
        clipBehavior: clipBehavior,
        itemCount: state.result.items.length,
        itemBuilder: (context, index) {
          if (state.isLastItem(index) && state.hasMore) context.read<C>().fetchMore();

          final doc = state.result.items[index];
          return itemBuilder(context, doc);
        }
      );
    }
  );
}