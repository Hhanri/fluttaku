import 'package:fluttaku/anime/domain/entities/anime_episode_links_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_info_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_search_entity.dart';

abstract class AnimeAPIRepositoryInterface {

  Future<List<AnimeSearchEntity>> searchAnime({required String query, required int page, int pageSize = 10});

  Future<List<AnimeSearchEntity>> popularAnime({required int page, int pageSize = 10});

  Future<List<AnimeSearchEntity>> trendingAnime({required int page, int pageSize = 10});

  Future<AnimeInfoEntity> fetchAnimeInfo({required String animeId});

  Future<AnimeEpisodeLinksEntity> fetchEpisodes({required String episodeId});
  
}