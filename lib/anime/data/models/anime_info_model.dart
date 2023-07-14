import 'package:fluttaku/anime/data/models/anime_episode_info_model.dart';
import 'package:fluttaku/anime/data/models/anime_preview_model.dart';
import 'package:fluttaku/anime/data/models/anime_title_model.dart';
import 'package:fluttaku/anime/domain/entities/anime_info_entity.dart';
import 'package:fluttaku/core/constants/anime_dto_constants.dart';
import 'package:fluttaku/core/interfaces/airing_status.dart';

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
      status: parseAiringStatus(json[AnimeDTOConstants.status]) ,
      releaseYear: json[AnimeDTOConstants.releaseDate],
      startDate: _Date.fromJson(json[AnimeDTOConstants.startDate]).toDateTime(),
      endDate: _Date.fromJson(json[AnimeDTOConstants.endDate]).toDateTime(),
      season: json[AnimeDTOConstants.season],
      genres: List<String>.from(json[AnimeDTOConstants.genres]),
      rating: json[AnimeDTOConstants.rating],
      totalEpisodes: json[AnimeDTOConstants.totalEpisodes],
      currentEpisode: json[AnimeDTOConstants.currentEpisode],
      duration: json[AnimeDTOConstants.duration],
      studios: List<String>.from(json[AnimeDTOConstants.studios]),
      type: json[AnimeDTOConstants.type],
      recommendations:
        (json[AnimeDTOConstants.recommendations] as List<dynamic>)
          .map<AnimePreviewModel>((e) => AnimePreviewModel.fromJson(e))
          .toList(),
      episodes:
        (json[AnimeDTOConstants.episodes] as List<dynamic>)
          .map<AnimeEpisodeInfoModel>((e) => AnimeEpisodeInfoModel.fromJson(e))
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