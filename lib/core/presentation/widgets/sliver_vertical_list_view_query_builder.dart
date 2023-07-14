import 'package:fluttaku/core/interfaces/search_result_interface.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_query_cubit.dart';
import 'package:fluttaku/core/presentation/widgets/query_builder.dart';
import 'package:fluttaku/core/use_cases/use_case.dart';
import 'package:fluttaku/core/utils/anime_query_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverVerticalListViewQueryBuilder<
  C extends BaseQueryCubit<U, I>,
  U extends UseCase<SearchResultInterface<I>, QueryParams>,
  I
> extends QueryBuilder<C, U, I> {
  final Widget Function(BuildContext context, I item) itemBuilder;

  SliverVerticalListViewQueryBuilder({
    super.key,
    required this.itemBuilder,
  }) : super(
    emptyBuilder: (context) => const SliverToBoxAdapter(child: QueryBuilder.defaultNoItemFound,),
    loadingBuilder: (context) => const SliverToBoxAdapter(child: QueryBuilder.defaultLoading,),
    errorBuilder: (context, failure) => SliverToBoxAdapter(child: QueryBuilder.defaultFailure(failure.message),),
    builder: (context, state) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (state.isLastItem(index) && state.hasMore) context.read<C>().fetchMore();

            final doc = state.result.items[index];
            return itemBuilder(context, doc);
          },
          childCount: state.result.items.length,
        ),
      );
    }
  );
}