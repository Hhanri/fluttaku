import 'package:fluttaku/anime/domain/entities/anime_title_entity.dart';
import 'package:fluttaku/core/interfaces/airing_status.dart';

abstract class AnimePreviewEntity {
  final String id;
  final AnimeTitleEntity title;
  final AiringStatus status;
  final String coverImage;
  final String type;
  final int? rating;
  final List<String> genres;

  AnimePreviewEntity({
    required this.id,
    required this.title,
    required this.status,
    required this.coverImage,
    required this.type,
    required this.rating,
    required this.genres
  });
}

