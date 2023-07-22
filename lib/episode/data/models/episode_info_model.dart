import 'package:fluttaku/core/constants/anime_dto_constants.dart';
import 'package:fluttaku/episode/domain/entities/episode_info_entity.dart';

class EpisodeInfoModel extends EpisodeInfoEntity {
  EpisodeInfoModel({
    required super.id,
    required super.title,
    required super.description,
    required super.number,
    required super.thumbnail
  });

  factory EpisodeInfoModel.fromJson(Map<String, dynamic> json) {
    return EpisodeInfoModel(
      id: json[AnimeDTOConstants.id],
      title: json[AnimeDTOConstants.title],
      description: json[AnimeDTOConstants.description] ?? "",
      number: json[AnimeDTOConstants.number],
      thumbnail: json[AnimeDTOConstants.image]
    );
  }
}