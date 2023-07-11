import 'package:fluttaku/anime/data/models/anime_episode_info_model.dart';
import 'package:fluttaku/anime/data/models/anime_preview_entity.dart';
import 'package:fluttaku/anime/data/models/anime_title_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_episode_info_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_info_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/core/constants/anime_dto_constants.dart';

class AnimeInfoModel extends AnimeInfoEntity {
  AnimeInfoModel({
    required super.id,
    required super.title,
    required super.coverImage,
    required super.bannerImage,
    required super.color,
    required super.description,
    required super.status,
    required super.releaseYear,
    required super.startDate,
    required super.endDate,
    required super.season,
    required super.genres,
    required super.rating,
    required super.totalEpisodes,
    required super.currentEpisode,
    required super.duration,
    required super.studios,
    required super.type,
    required super.recommendations,
    required super.episodes
  });

  factory AnimeInfoModel.fromJson(Map<String, dynamic> json) {
    return AnimeInfoModel(
      id: json[AnimeDTOConstants.id],
      title: AnimeTitleModel.formJson(json[AnimeDTOConstants.title]),
      coverImage: json[AnimeDTOConstants.image],
      bannerImage: json[AnimeDTOConstants.cover],
      color: json[AnimeDTOConstants.color],
      description: json[AnimeDTOConstants.description],
      status: json[AnimeDTOConstants.status],
      releaseYear: json[AnimeDTOConstants.releaseDate],
      startDate: _Date.fromJson(json[AnimeDTOConstants.startDate]).toDateTime(),
      endDate: _Date.fromJson(json[AnimeDTOConstants.endDate]).toDateTime(),
      season: json[AnimeDTOConstants.season],
      genres: json[AnimeDTOConstants.genres],
      rating: json[AnimeDTOConstants.rating],
      totalEpisodes: json[AnimeDTOConstants.totalEpisodes],
      currentEpisode: json[AnimeDTOConstants.currentEpisode],
      duration: json[AnimeDTOConstants.duration],
      studios: json[AnimeDTOConstants.studios],
      type: json[AnimeDTOConstants.type],
      recommendations:
        (json[AnimeDTOConstants.recommendations] as List<Map<String, dynamic>>)
          .map<AnimePreviewEntity>((e) => AnimePreviewModel.fromJson(e))
          .toList(),
      episodes:
        (json[AnimeDTOConstants.episodes] as List<Map<String, dynamic>>)
          .map<AnimeEpisodeInfoEntity>((e) => AnimeEpisodeInfoModel.fromJson(e))
          .toList()
    );
  }
}

class _Date {
  final int year;
  final int month;
  final int day;

  _Date({
    required this.year,
    required this.month,
    required this.day
  });

  factory _Date.fromJson(Map<String, dynamic> json) {
    return _Date(
      year: json[AnimeDTOConstants.year],
      month: json[AnimeDTOConstants.month],
      day: json[AnimeDTOConstants.day]
    );
  }

  DateTime toDateTime() {
    return DateTime(year, month, day);
  }
}