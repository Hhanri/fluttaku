import 'package:fluttaku/anime/domain/entities/anime_episode_streaming_source_entity.dart';

abstract class AnimeEpisodeLinksEntity {
  final List<AnimeEpisodeStreamingSourceEntity> sources;
  final String downloadUrl;

  AnimeEpisodeLinksEntity({
    required this.sources,
    required this.downloadUrl
  });

  List<AnimeEpisodeStreamingSourceEntity> get properSources;
}