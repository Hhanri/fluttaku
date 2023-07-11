import 'package:fluttaku/anime/data/models/anime_title_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_search_entity.dart';
import 'package:fluttaku/core/constants/anime_dto_constants.dart';

class AnimeSearchModel extends AnimeSearchEntity {
  AnimeSearchModel({
    required super.id,
    required super.title,
    required super.status,
    required super.posterImage,
    required super.type,
    required super.rating,
    required super.genres
  });

  factory AnimeSearchModel.fromJson(Map<String, dynamic> json) {
    return AnimeSearchModel(
      id: json[AnimeDTOConstants.id],
      title: AnimeTitleModel.formJson(json[AnimeDTOConstants.title]),
      status: json[AnimeDTOConstants.status],
      posterImage: json[AnimeDTOConstants.image],
      type: json[AnimeDTOConstants.type],
      rating: json[AnimeDTOConstants.rating],
      genres: json[AnimeDTOConstants.genres]
    );
  }
}