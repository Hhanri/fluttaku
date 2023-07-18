import 'package:fluttaku/anime/presentation/cubits/anime_info_cubit/anime_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeInfoNavBar extends StatelessWidget {
  const AnimeInfoNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: context.select<AnimeInfoCubit, int>((value) => value.navBarState.index),
      onDestinationSelected: (index) {
        context.read<AnimeInfoCubit>().changeNavBarState(newState: AnimeInfoNavBarState.values[index]);
      },
      destinations: AnimeInfoNavBarModel
        .values
        .map((e) => NavigationDestination(icon: Icon(e.icon), label: e.label,))
        .toList()
    );
  }
}

class AnimeInfoNavBarModel {
  final IconData icon;
  final String label;
  final AnimeInfoNavBarState state;

  const AnimeInfoNavBarModel({
    required this.icon,
    required this.label,
    required this.state
  });

  static const List<AnimeInfoNavBarModel> values = [
    AnimeInfoNavBarModel(
      icon: Icons.description,
      label: "Details",
      state: AnimeInfoNavBarState.details
    ),
    AnimeInfoNavBarModel(
      icon: Icons.tv,
      label: "Watch",
      state: AnimeInfoNavBarState.watch
    )
  ];
}