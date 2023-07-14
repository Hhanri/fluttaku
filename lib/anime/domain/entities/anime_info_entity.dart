import 'package:fluttaku/anime/domain/entities/anime_episode_info_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_title_entity.dart';
import 'package:fluttaku/core/interfaces/airing_status.dart';

abstract class AnimeInfoEntity {
  final String id;
  final AnimeTitleEntity title;
  final String coverImage;
  final String bannerImage;
  final String color;
  final String description;
  final AiringStatus status;
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
  final List<AnimePreviewEntity> recommendations;
  final List<AnimeEpisodeInfoEntity> episodes;

  AnimeInfoEntity({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.bannerImage,
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

