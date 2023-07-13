import 'package:fluttaku/core/error/failure.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_query_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QueryBuilder<I> extends StatefulWidget {

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
  State<QueryBuilder<I>> createState() => _QueryBuilderState<I>();
}

class _QueryBuilderState<I> extends State<QueryBuilder<I>> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<BaseQueryCubit<I>, BaseQueryState<I>>(
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
