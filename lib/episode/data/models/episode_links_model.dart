import 'package:fluttaku/episode/data/models/episode_streaming_source_model.dart';
import 'package:fluttaku/episode/domain/entities/episode_links_entity.dart';
import 'package:fluttaku/core/constants/anime_dto_constants.dart';
import 'package:fluttaku/episode/domain/entities/episode_streaming_source_entity.dart';

class EpisodeLinksModel extends EpisodeLinksEntity {
  EpisodeLinksModel({
    required super.sources,
    required super.downloadUrl
  });

  factory EpisodeLinksModel.fromJson(Map<String, dynamic> json) {
    return EpisodeLinksModel(
      sources:
        (json[AnimeDTOConstants.sources] as List<dynamic>)
          .map<EpisodeStreamingSourceModel>((e) => EpisodeStreamingSourceModel.fromJson(e))
          .toList(),
      downloadUrl: json[AnimeDTOConstants.download]
    );
  }

  @override
  List<EpisodeStreamingSourceEntity> get properSources => sources
    .where((element) => element.quality != "default" && element.quality != "backup")
    .toList();
}