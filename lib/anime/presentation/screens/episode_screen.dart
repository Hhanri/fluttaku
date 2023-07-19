import 'package:chewie/chewie.dart';
import 'package:fluttaku/anime/presentation/cubits/episode_cubit/episode_cubit.dart';
import 'package:fluttaku/anime/presentation/widgets/episode/video_error_widget.dart';
import 'package:fluttaku/core/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder<EpisodeCubit, EpisodeState>(
            builder: (context, state) {
              if (state is EpisodeErrorState) {
                return VideoErrorWidget(
                  failure: state.failure
                );
              } else if (state is EpisodeLoadedState) {
                return Chewie(
                  controller: state.chewieController
                );
              }
              return const Center(
                  child: CircularProgressIndicator(
                    color: MyColors.primaryColor
                  )
              );
            }
          )
        ],
      ),
    );
  }
}
