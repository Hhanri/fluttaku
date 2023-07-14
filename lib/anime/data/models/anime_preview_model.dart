import 'package:fluttaku/anime/data/models/anime_title_model.dart';
import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/core/constants/anime_dto_constants.dart';
import 'package:fluttaku/core/interfaces/airing_status.dart';

class AnimePreviewModel extends AnimePreviewEntity {
  AnimePreviewModel({
    required super.id,
    required super.title,
    required super.status,
    required super.coverImage,
    required super.type,
    required super.rating,
    required super.genres
  });

  factory AnimePreviewModel.fromJson(Map<String, dynamic> json) {
    return AnimePreviewModel(
      id: json[AnimeDTOConstants.id].toString(),
      title: AnimeTitleModel.formJson(json[AnimeDTOConstants.title]),
      status: parseAiringStatus(json[AnimeDTOConstants.status]),
      coverImage: json[AnimeDTOConstants.image],
      type: json[AnimeDTOConstants.type],
      rating: json[AnimeDTOConstants.rating],
      genres: List<String>.from(json[AnimeDTOConstants.genres] ?? [])
    );
  }
}