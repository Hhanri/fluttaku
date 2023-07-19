part of 'episode_cubit.dart';

@immutable
abstract class EpisodeState extends Equatable {
  final AnimeEpisodeInfoEntity episodeInfo;

  const EpisodeState({required this.episodeInfo});

  @override
  List<Object?> get props => [episodeInfo];
}

class EpisodeLoadingState extends EpisodeState {
  const EpisodeLoadingState({required super.episodeInfo,});

  @override
  List<Object?> get props => [episodeInfo];
}

class EpisodeLoadedState extends EpisodeState {
  final ChewieController chewieController;
  final String url;
  final AnimeEpisodeLinksEntity links;
  const EpisodeLoadedState({
    required super.episodeInfo,
    required this.chewieController,
    required this.url,
    required this.links
  });

  @override
  List<Object?> get props => [episodeInfo, chewieController, url, links];
}

class EpisodeErrorState extends EpisodeState {
  final Failure failure;
  const EpisodeErrorState({
    required super.episodeInfo,
    required this.failure
  });

  @override
  List<Object?> get props => [episodeInfo, failure];
}