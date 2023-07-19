import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttaku/anime/domain/entities/anime_episode_info_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_episode_links_entity.dart';
import 'package:fluttaku/anime/domain/use_cases/fetch_episode_links.dart';
import 'package:fluttaku/anime/presentation/widgets/episode/quality_selection_widget.dart';
import 'package:fluttaku/core/error/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

part 'episode_state.dart';

class EpisodeCubit extends Cubit<EpisodeState> {
  final FetchEpisodeLinksUseCase useCase;
  final AnimeEpisodeInfoEntity episodeInfo;

  EpisodeCubit({required this.episodeInfo, required this.useCase}) : super(EpisodeLoadingState(episodeInfo: episodeInfo));

  late AnimeEpisodeLinksEntity links;
  ChewieController? _chewieController;
  VideoPlayerController? _videoPlayerController;
  String? currentlyPlayed;

  void init() async {
    emit(EpisodeLoadingState(episodeInfo: episodeInfo));
    final res = await useCase.call(episodeInfo.id);
    res.fold(
      (error) => emit(EpisodeErrorState(episodeInfo: episodeInfo, failure: error)),
      (success){
        links = success;
        currentlyPlayed ??= links
          .properSources
          .last
          .url;
        emitNewController(currentlyPlayed!);
      }
    );
  }

  void emitNewController(String url) async {
    final Duration? currentPosition = await _videoPlayerController?.position;
    _chewieController = buildController(url, duration: currentPosition);
    if (_chewieController != null && currentlyPlayed != null) {
      emit(EpisodeLoadedState(episodeInfo: episodeInfo, chewieController: _chewieController!, url: currentlyPlayed!, links: links));
    }
  }

  @override
  Future<void> close() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    return super.close();
  }

  ChewieController buildController(String url, {Duration? duration}) {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    return ChewieController(
      videoPlayerController: _videoPlayerController!,
      allowedScreenSleep: false,
      autoPlay: true,
      aspectRatio: 16/9,
      startAt: duration,
      additionalOptions: (context) => [
        OptionItem(
          onTap: () => _selectQuality(context),
          iconData: Icons.hd_outlined,
          title: "Quality"
        )
      ]
    );
  }

  void _selectQuality(BuildContext context) async {
    final newQuality = Platform.isIOS
      ? await showIosQualityModal(context: context, links: links.properSources, url: currentlyPlayed!)
      : await showAndroidQualityModel(context: context, links: links.properSources, url: currentlyPlayed!);
    if (newQuality == null || newQuality == currentlyPlayed) return;
    currentlyPlayed = newQuality;
    emitNewController(newQuality);
  }
}
