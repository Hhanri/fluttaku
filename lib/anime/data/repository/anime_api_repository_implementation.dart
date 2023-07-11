import 'package:fluttaku/anime/data/data_source/anime_data_source_interface.dart';
import 'package:fluttaku/anime/domain/entities/anime_episode_links_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_info_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_search_result_entity.dart';
import 'package:fluttaku/anime/domain/repository/anime_api_repository_interface.dart';

class AnimeApiRepositoryImpl implements AnimeAPIRepositoryInterface {

  final AnimeDataSourceInterface dataSource;

  AnimeApiRepositoryImpl(this.dataSource);

  @override
  Future<AnimeInfoEntity> fetchAnimeInfo({required String animeId}) {
    return dataSource.fetchAnimeInfo(animeId: animeId);
  }

  @override
  Future<AnimeEpisodeLinksEntity> fetchEpisodeLinks({required String episodeId}) {
    return dataSource.fetchEpisodeLinks(episodeId: episodeId);
  }

  @override
  Future<AnimeSearchResultEntity> genericSearch({required String uri}) {
    return dataSource.genericSearch(uri: uri);
  }

  @override
  Future<AnimeSearchResultEntity> popularAnime({required int page, int pageSize = 10}) {
    return dataSource.popularAnime(page: page, pageSize: pageSize);
  }

  @override
  Future<AnimeSearchResultEntity> searchAnime({required String query, required int page, int pageSize = 10}) {
    return dataSource.searchAnime(query: query, page: page, pageSize: pageSize);
  }

  @override
  Future<AnimeSearchResultEntity> trendingAnime({required int page, int pageSize = 10}) {
    return dataSource.trendingAnime(page: page, pageSize: pageSize);
  }

}