import 'package:fluttaku/episode/domain/entities/episode_streaming_source_entity.dart';

abstract class EpisodeLinksEntity {
  final List<EpisodeStreamingSourceEntity> sources;
  final String downloadUrl;

  EpisodeLinksEntity({
    required this.sources,
    required this.downloadUrl
  });

  List<EpisodeStreamingSourceEntity> get properSources;
}