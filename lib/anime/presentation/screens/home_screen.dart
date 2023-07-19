import 'package:fluttaku/anime/presentation/cubits/query_cubit/popular_animes_query_cubit.dart';
import 'package:fluttaku/anime/presentation/widgets/home/popular_animes_widget.dart';
import 'package:fluttaku/anime/presentation/widgets/text_fields/home_search_button.dart';
import 'package:fluttaku/anime/presentation/widgets/home/trending_animes_widget.dart';
import 'package:fluttaku/core/config/theme.dart';
import 'package:fluttaku/core/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: HomeSearchButton()
            ),
          ),
          TrendingAnimesWidget(),

          const SliverToBoxAdapter(
            child: Padding(
              padding: MyTheme.defaultPadding,
              child: Text("Popular Animes", style: MyTextStyle.sectionTitleStyle,),
            ),
          ),
          BlocProvider<PopularAnimesQueryCubit>(
            create: (context) => sl.get<PopularAnimesQueryCubit>(),
            child: PopularAnimesWidget(),
          )
        ],
      ),
    );
  }
}
