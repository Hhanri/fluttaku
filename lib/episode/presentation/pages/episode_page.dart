import 'package:fluttaku/episode/domain/entities/episode_info_entity.dart';
import 'package:fluttaku/episode/presentation/cubits/episode_cubit/episode_cubit.dart';
import 'package:fluttaku/episode/presentation/screens/episode_screen.dart';
import 'package:fluttaku/core/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodePage extends StatelessWidget {
  final EpisodeInfoEntity episodeInfo;
  const EpisodePage({Key? key, required this.episodeInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EpisodeCubit>(
      create: (context) => sl.get<EpisodeCubit>(param1: episodeInfo)..init(),
      child: const EpisodeScreen(),
    );
  }
}
