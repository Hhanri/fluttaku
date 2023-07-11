import 'package:fluttaku/anime/domain/entities/anime_episode_links_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_info_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_search_result_entity.dart';
import 'package:fluttaku/core/constants/default_page_size.dart';

abstract class AnimeDataSourceInterface {

  Future<AnimeSearchResultEntity> genericSearch({required String uri});

  Future<AnimeSearchResultEntity> searchAnime({required String query, required int page, int pageSize = defaultPageSize});

  Future<AnimeSearchResultEntity> fetchPopularAnimes({required int page, int pageSize = defaultPageSize});

  Future<AnimeSearchResultEntity> fetchTrendingAnimes({required int page, int pageSize = defaultPageSize});

  Future<AnimeInfoEntity> fetchAnimeInfo({required String animeId});

  Future<AnimeEpisodeLinksEntity> fetchEpisodeLinks({required String episodeId});

}