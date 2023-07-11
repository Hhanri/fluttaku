import 'package:fluttaku/anime/domain/entities/anime_episode_streaming_source_entity.dart';
import 'package:fluttaku/core/constants/anime_dto_constants.dart';

class AnimeEpisodeStreamingSourceModel extends AnimeEpisodeStreamingSourceEntity {
  AnimeEpisodeStreamingSourceModel({
    required super.url,
    required super.isM3U8,
    required super.quality
  });

  factory AnimeEpisodeStreamingSourceModel.fromJson(Map<String, dynamic> json) {
    return AnimeEpisodeStreamingSourceModel(
      url: json[AnimeDTOConstants.url],
      isM3U8: json[AnimeDTOConstants.isM3U8],
      quality: json[AnimeDTOConstants.quality]
    );
  }
}