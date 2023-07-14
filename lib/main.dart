import 'package:fluttaku/anime/presentation/cubits/query_cubit/popular_animes_query_cubit.dart';
import 'package:fluttaku/anime/presentation/screens/home_screen.dart';
import 'package:fluttaku/anime/presentation/screens/search_anime_screen.dart';
import 'package:fluttaku/anime/presentation/widgets/popular_animes_widget.dart';
import 'package:fluttaku/anime/presentation/widgets/trending_animes_widget.dart';
import 'package:fluttaku/core/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupSL();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluttaku',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          TrendingAnimesWidget2(),
          BlocProvider<PopularAnimesQueryCubit>(
            create: (context) => sl.get<PopularAnimesQueryCubit>(),
            child: PopularAnimesWidget2(),
          )
        ],
      ),
    );

    return Scaffold(
      body: DefaultTabController(
          length: 2,
          child: PageView(
            children: [
              const HomeScreen(),
              SearchAnimeScreen()
            ],
          )
      ),
    );
  }
}
