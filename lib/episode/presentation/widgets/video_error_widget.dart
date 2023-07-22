import 'package:fluttaku/core/config/theme.dart';
import 'package:fluttaku/core/error/failure.dart';
import 'package:fluttaku/episode/presentation/cubits/episode_cubit/episode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoErrorWidget extends StatelessWidget {
  final Failure failure;
  const VideoErrorWidget({Key? key, required this.failure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(failure.message, style: MyTextStyle.ratingStyle,),
        IconButton(
          onPressed: context.read<EpisodeCubit>().init,
          icon: const Icon(Icons.refresh, color: MyColors.foregroundColor,)
        )
      ],
    );
  }
}
