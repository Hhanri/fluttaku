import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/core/interfaces/search_result_interface.dart';

abstract class AnimeSearchResultEntity extends SearchResultInterface<AnimePreviewEntity> {
  AnimeSearchResultEntity({
    required super.hasNextPage,
    required super.currentPage,
    required super.items
  });

  @override
  AnimeSearchResultEntity copyWith({
    bool? hasNextPage,
    int? currentPage,
    List<AnimePreviewEntity>? items
  });
}