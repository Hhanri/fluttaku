import 'package:fluttaku/core/config/theme.dart';
import 'package:fluttaku/core/interfaces/search_result_interface.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_query_cubit.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_search_query_cubit.dart';
import 'package:fluttaku/core/presentation/widgets/sliver_grid_view_query_builder.dart';
import 'package:fluttaku/core/presentation/widgets/sliver_vertical_list_view_query_builder.dart';
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
  final Widget Function(BuildContext context, I item) listItemBuilder;
  final Widget Function(BuildContext context, I item) gridItemBuilder;

  const SearchScreenBuilder({
    Key? key,
    required this.listItemBuilder,
    required this.gridItemBuilder,
    required this.textFieldBuilder
  }) : super(key: key);

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

                SliverToBoxAdapter(
                  child: Padding(
                    padding: MyTheme.defaultPadding,
                    child: Row(
                      children: [
                        const Text("Search Results", style: MyTextStyle.sectionTitleStyle,),
                        const Spacer(),
                        ..._IconDisplayMode.values.map((e) => _IconDisplayModeButton<C, U, I>(iconDisplayMode: e,))
                      ],
                    ),
                  ),
                ),

                BlocBuilder<C, BaseQueryState>(
                  builder: (context, state) {
                    switch (state.displayMode) {
                      case SearchResultDisplayMode.grid: return SliverGridViewQueryBuilder<C, U, I>(itemBuilder: gridItemBuilder);
                      case SearchResultDisplayMode.list: return SliverVerticalListViewQueryBuilder<C, U, I>(itemBuilder: listItemBuilder);
                      default: return SliverGridViewQueryBuilder<C, U, I>(itemBuilder: gridItemBuilder);
                    }
                  },
                )

              ],
            );
          }
        ),
      ),
    );
  }
}


class _IconDisplayMode {
  final IconData icon;
  final SearchResultDisplayMode displayMode;

  const _IconDisplayMode({required this.icon, required this.displayMode});

  static const _list = _IconDisplayMode(icon: Icons.view_list_rounded, displayMode: SearchResultDisplayMode.list);
  static const _grid = _IconDisplayMode(icon: Icons.grid_view_rounded, displayMode: SearchResultDisplayMode.grid);

  static const values = [_list, _grid];
}

class _IconDisplayModeButton<
  C extends BaseSearchQueryCubit<U, I>,
  U extends UseCase<SearchResultInterface<I>, SearchQueryParams>,
  I
> extends StatelessWidget {
  final _IconDisplayMode iconDisplayMode;
  const _IconDisplayModeButton({Key? key, required this.iconDisplayMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<C>().changeDisplayMode(iconDisplayMode.displayMode),
      icon: Icon(
        iconDisplayMode.icon,
        color: context.select<C, bool>((value){
          return value.displayMode == iconDisplayMode.displayMode;
        }) ? Colors.black87: Colors.black45,
      )
    );
  }
}
