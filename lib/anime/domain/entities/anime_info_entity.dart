import 'package:fluttaku/anime/domain/entities/anime_episode_info_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_search_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_title_entity.dart';

abstract class AnimeInfoEntity {
  final String id;
  final AnimeTitleEntity title;
  final String posterImage;
  final String coverImage;
  final String color;
  final String description;
  final String status;
  final int releaseYear;
  final DateTime startDate;
  final DateTime endDate;
  final String season;
  final List<String> genres;
  final int rating;
  final int totalEpisodes;
  final int currentEpisode;
  final int duration;
  final List<String> studios;
  final String type;
  final List<AnimeSearchEntity> recommendations;
  final List<AnimeEpisodeInfoEntity> episodes;

  AnimeInfoEntity({
    required this.id,
    required this.title,
    required this.posterImage,
    required this.coverImage,
    required this.color,
    required this.description,
    required this.status,
    required this.releaseYear,
    required this.startDate,
    required this.endDate,
    required this.season,
    required this.genres,
    required this.rating,
    required this.totalEpisodes,
    required this.currentEpisode,
    required this.duration,
    required this.studios,
    required this.type,
    required this.recommendations,
    required this.episodes
  });
}

