import 'package:fluttaku/core/interfaces/search_result_interface.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_search_query_cubit.dart';
import 'package:fluttaku/core/presentation/widgets/sliver_grid_view_query_builder.dart';
import 'package:fluttaku/core/service_locator.dart';
import 'package:fluttaku/core/use_cases/use_case.dart';
import 'package:fluttaku/core/utils/anime_query_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreenBuilder<
  C extends BaseSearchQueryCubit<U, I>,
  U extends UseCase<SearchResultInterface<I>, SearchQueryParams>,
  I
> extends StatelessWidget {
  final Widget Function(TextEditingController controller, VoidCallback onSearch) textFieldBuilder;
  final Widget Function(BuildContext context, I item) itemBuilder;
  const SearchScreenBuilder({Key? key, required this.itemBuilder, required this.textFieldBuilder}) : super(key: key);

  Widget searchBar(BuildContext context) {
    final cubit = context.read<C>();
    return SliverToBoxAdapter(
      child: SafeArea(
        child: textFieldBuilder(cubit.textController, cubit.search)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<C>(
      create: (create) => sl.get<C>(),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return CustomScrollView(
              slivers: [
                searchBar(context),
                //SliverVerticalListViewQueryBuilder<C, U, I>(itemBuilder: itemBuilder)
                SliverGridViewQueryBuilder<C, U, I>(itemBuilder: itemBuilder)
              ],
            );
          }
        ),
      ),
    );
  }
}
