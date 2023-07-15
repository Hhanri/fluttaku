import 'package:fluttaku/anime/domain/entities/anime_title_entity.dart';
import 'package:fluttaku/core/interfaces/airing_status.dart';

abstract class AnimePreviewEntity {
  final String id;
  final AnimeTitleEntity title;
  final AiringStatus status;
  final String coverImage;
  final String? bannerImage;
  final String type;
  final int? rating;
  final List<String> genres;
  final int totalEpisodes;

  AnimePreviewEntity({
    required this.id,
    required this.title,
    required this.status,
    required this.coverImage,
    required this.bannerImage,
    required this.type,
    required this.rating,
    required this.genres,
    required this.totalEpisodes,
  });

  bool get isAiring => status == AiringStatus.ongoing;
}

