import 'package:fluttaku/core/constants/anime_dto_constants.dart';
import 'package:fluttaku/episode/domain/entities/episode_streaming_source_entity.dart';

class EpisodeStreamingSourceModel extends EpisodeStreamingSourceEntity {
  EpisodeStreamingSourceModel({
    required super.url,
    required super.isM3U8,
    required super.quality
  });

  factory EpisodeStreamingSourceModel.fromJson(Map<String, dynamic> json) {
    return EpisodeStreamingSourceModel(
      url: json[AnimeDTOConstants.url],
      isM3U8: json[AnimeDTOConstants.isM3U8],
      quality: json[AnimeDTOConstants.quality]
    );
  }
}