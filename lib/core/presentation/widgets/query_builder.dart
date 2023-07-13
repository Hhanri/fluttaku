import 'package:fluttaku/core/error/failure.dart';
import 'package:fluttaku/core/interfaces/search_result_interface.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_query_cubit.dart';
import 'package:fluttaku/core/use_cases/use_case.dart';
import 'package:fluttaku/core/utils/anime_query_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QueryBuilder<
  C extends BaseQueryCubit<U, I>,
  U extends UseCase<SearchResultInterface<I>, QueryParams>,
  I
> extends StatefulWidget {

  final Widget Function(BuildContext context, BaseQuerySuccessState<I> state) builder;
  final Widget Function(BuildContext context, Failure error)? errorBuilder;
  final Widget Function(BuildContext context)? loadingBuilder;

  const QueryBuilder({
    Key? key,
    required this.builder,
    this.errorBuilder,
    this.loadingBuilder,

  }) : super(key: key);

  @override
  State<QueryBuilder<C, U, I>> createState() => _QueryBuilderState<C, U, I>();
}

class _QueryBuilderState<
  C extends BaseQueryCubit<U, I>,
  U extends UseCase<SearchResultInterface<I>, QueryParams>,
  I
> extends State<QueryBuilder<C, U, I>> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<C, BaseQueryState<I>>(
      builder: (context, state) {
        if (state is BaseQueryErrorState<I>) {
          return widget.errorBuilder?.call(context, state.failure)
            ?? Center(child: Text(state.failure.message));
        } else if (state is BaseQuerySuccessState<I>) {
          return widget.builder(context, state);
        } else {
          return widget.loadingBuilder?.call(context)
            ?? const Center(child: CircularProgressIndicator());
        }
      }
    );
  }

  @override
  bool get wantKeepAlive => true;
}
