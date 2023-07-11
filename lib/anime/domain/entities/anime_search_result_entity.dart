import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';

abstract class AnimeSearchResultEntity {
  final bool hasNextPage;
  final int currentPage;
  final List<AnimePreviewEntity> animes;

  AnimeSearchResultEntity({
    required this.hasNextPage,
    required this.currentPage,
    required this.animes
  });
}