import 'package:fluttaku/anime/domain/entities/anime_episode_links_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_info_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';

abstract class AnimeAPIRepositoryInterface {

  Future<List<AnimePreviewEntity>> searchAnime({required String query, required int page, int pageSize = 10});

  Future<List<AnimePreviewEntity>> popularAnime({required int page, int pageSize = 10});

  Future<List<AnimePreviewEntity>> trendingAnime({required int page, int pageSize = 10});

  Future<AnimeInfoEntity> fetchAnimeInfo({required String animeId});

  Future<AnimeEpisodeLinksEntity> fetchEpisodeLinks({required String episodeId});

}