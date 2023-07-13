import 'package:fluttaku/core/interfaces/search_result_interface.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_query_cubit.dart';
import 'package:fluttaku/core/presentation/widgets/list_view_query_builder.dart';
import 'package:fluttaku/core/service_locator.dart';
import 'package:fluttaku/core/use_cases/use_case.dart';
import 'package:fluttaku/core/utils/anime_query_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HorizontalListViewQueryBuilder<
  C extends BaseQueryCubit<U, I>,
  U extends UseCase<SearchResultInterface<I>, QueryParams>,
  I
> extends StatelessWidget {
  final String title;
  final Widget Function(BuildContext context, I item) itemBuilder;
  const HorizontalListViewQueryBuilder({Key? key, required this.title, required this.itemBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<BaseQueryCubit<U, I>>(
      create: (context) => sl.get<C>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Expanded(
            child: ListViewQueryBuilder<U, I>(
              scrollDirection: Axis.horizontal,
              itemBuilder: itemBuilder,
            ),
          )
        ],
      ),
    );
  }
}
