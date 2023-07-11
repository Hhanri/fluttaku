import 'package:fluttaku/anime/domain/entities/anime_episode_info_entity.dart';
import 'package:fluttaku/core/constants/anime_dto_constants.dart';

class AnimeEpisodeInfoModel extends AnimeEpisodeInfoEntity {
  AnimeEpisodeInfoModel({
    required super.id,
    required super.title,
    required super.description,
    required super.number,
    required super.thumbnail
  });

  factory AnimeEpisodeInfoModel.fromJson(Map<String, dynamic> json) {
    return AnimeEpisodeInfoModel(
      id: json[AnimeDTOConstants.id],
      title: json[AnimeDTOConstants.title],
      description: json[AnimeDTOConstants.description] ?? "",
      number: json[AnimeDTOConstants.number],
      thumbnail: json[AnimeDTOConstants.image]
    );
  }
}