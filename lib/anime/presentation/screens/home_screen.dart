import 'package:fluttaku/anime/presentation/cubits/query_cubit/popular_animes_query_cubit.dart';
import 'package:fluttaku/anime/presentation/widgets/popular_animes_widget.dart';
import 'package:fluttaku/anime/presentation/widgets/text_fields/home_search_button.dart';
import 'package:fluttaku/anime/presentation/widgets/trending_animes_widget.dart';
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
            child: HomeSearchButton(),
          ),
          TrendingAnimesWidget(),
          BlocProvider<PopularAnimesQueryCubit>(
            create: (context) => sl.get<PopularAnimesQueryCubit>(),
            child: PopularAnimesWidget(),
          )
        ],
      ),
    );
  }
}
