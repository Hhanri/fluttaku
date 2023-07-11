import 'package:fluttaku/anime/data/models/anime_episode_streaming_source_model.dart';
import 'package:fluttaku/anime/domain/entities/anime_episode_links_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_episode_streaming_source_entity.dart';
import 'package:fluttaku/core/constants/anime_dto_constants.dart';

class AnimeEpisodeLinksModel extends AnimeEpisodeLinksEntity {
  AnimeEpisodeLinksModel({
    required super.sources,
    required super.downloadUrl
  });

  factory AnimeEpisodeLinksModel.fromJson(Map<String, dynamic> json) {
    return AnimeEpisodeLinksModel(
      sources:
        (json[AnimeDTOConstants.sources] as List<Map<String, dynamic>>)
          .map<AnimeEpisodeStreamingSourceEntity>((e) => AnimeEpisodeStreamingSourceModel.fromJson(e))
          .toList(),
      downloadUrl: json[AnimeDTOConstants.download]
    );
  }
}