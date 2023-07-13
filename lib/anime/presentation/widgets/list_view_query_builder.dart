import 'package:fluttaku/core/cubits/base_query_cubit/base_query_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewQueryBuilder<I> extends StatefulWidget {

  final Widget Function(BuildContext context, I doc) itemBuilder;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final Axis scrollDirection;
  const ListViewQueryBuilder({
    Key? key,
    required this.itemBuilder,
    this.padding,
    this.physics,
    this.scrollDirection = Axis.vertical
  }) : super(key: key);

  @override
  State<ListViewQueryBuilder<I>> createState() => _ListViewQueryBuilderState<I>();
}

class _ListViewQueryBuilderState<I> extends State<ListViewQueryBuilder<I>> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<BaseQueryCubit<I>, BaseQueryState>(
      builder: (context, state) {
        if (state is BaseQueryErrorState<I>) {
          return Center(
            child: Text(
              state.failure.message
            ),
          );
        } else if (state is BaseQuerySuccessState<I>) {
          return ListView.builder(
            padding: widget.padding,
            physics: widget.physics,
            scrollDirection: widget.scrollDirection,
            itemCount: state.result.items.length,
            itemBuilder: (context, index) {
              if (state.isLastItem(index) && state.hasMore) context.read<BaseQueryCubit<I>>().fetch();

              final doc = state.result.items[index];
              return widget.itemBuilder(context, doc);
            }
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }

  @override
  bool get wantKeepAlive => true;
}
