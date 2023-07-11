import 'package:fluttaku/anime/domain/entities/anime_title_entity.dart';

class AnimeSearchEntity {
  final String id;
  final AnimeTitleEntity title;
  final String status;
  final String posterImage;
  final String type;
  final int rating;
  final List<String> genres;

  AnimeSearchEntity({
    required this.id,
    required this.title,
    required this.status,
    required this.posterImage,
    required this.type,
    required this.rating,
    required this.genres
  });
}