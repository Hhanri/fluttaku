import 'package:fluttaku/anime/data/models/anime_preview_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_search_result_entity.dart';
import 'package:fluttaku/core/constants/anime_dto_constants.dart';

class AnimeSearchResultModel extends AnimeSearchResultEntity {
  AnimeSearchResultModel({
    required super.hasNextPage,
    required super.currentPage,
    required super.animes
  });

  factory AnimeSearchResultModel.fromJson(Map<String, dynamic> json) {
    return AnimeSearchResultModel(
      hasNextPage: json[AnimeDTOConstants.hasNextPage],
      currentPage: json[AnimeDTOConstants.currentPage],
      animes: (json[AnimeDTOConstants.results] as List<dynamic>)
        .map<AnimePreviewModel>((e) => AnimePreviewModel.fromJson(e))
        .toList()
    );
  }
}