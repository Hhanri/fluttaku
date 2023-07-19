import 'package:fluttaku/anime/presentation/cubits/anime_info_cubit/anime_info_cubit.dart';
import 'package:fluttaku/anime/presentation/widgets/episode/episode_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeInfoEpisodesWidget extends StatelessWidget {
  const AnimeInfoEpisodesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeInfoCubit, AnimeInfoState>(
      builder: (context, state) {
        if (state is AnimeInfoError) {
          return SliverToBoxAdapter(child: Center(child: Text(state.failure.message),));
        } else if (state is AnimeInfoLoaded) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return EpisodeTileWidget(episode: state.animeInfo.episodes[index],);
              },
              childCount: state.animeInfo.episodes.length
            ),
          );
        }
        return const SliverToBoxAdapter(child: Center(child:CircularProgressIndicator()));
      },
    );
  }
}
