import 'package:fluttaku/anime/data/models/anime_preview_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_search_result_entity.dart';
import 'package:fluttaku/core/constants/anime_dto_constants.dart';

class AnimeSearchResultModel extends AnimeSearchResultEntity {
  AnimeSearchResultModel({
    required super.hasNextPage,
    required super.currentPage,
    required super.items
  });

  factory AnimeSearchResultModel.fromJson(Map<String, dynamic> json) {
    return AnimeSearchResultModel(
      hasNextPage: json[AnimeDTOConstants.hasNextPage],
      currentPage: json[AnimeDTOConstants.currentPage],
      items: (json[AnimeDTOConstants.results] as List<dynamic>)
        .map<AnimePreviewModel>((e) => AnimePreviewModel.fromJson(e))
        .toList()
    );
  }

  @override
  AnimeSearchResultEntity copyWith({
    bool? hasNextPage,
    int? currentPage,
    List<AnimePreviewEntity>? items
  }) {
    return AnimeSearchResultModel(
      hasNextPage: hasNextPage ?? this.hasNextPage,
      currentPage: currentPage ?? this.currentPage,
      items: items ?? this.items
    );
  }
}