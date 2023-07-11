import 'package:dartz/dartz.dart';
import 'package:fluttaku/anime/data/data_source/anime_data_source_interface.dart';
import 'package:fluttaku/anime/domain/entities/anime_episode_links_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_info_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_search_result_entity.dart';
import 'package:fluttaku/anime/domain/repository/anime_api_repository_interface.dart';
import 'package:fluttaku/core/constants/default_page_size.dart';
import 'package:fluttaku/core/error/failure.dart';

class AnimeApiRepositoryImpl implements AnimeAPIRepositoryInterface {

  final AnimeDataSourceInterface dataSource;

  AnimeApiRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, AnimeInfoEntity>> fetchAnimeInfo({required String animeId}) {
    return _fetch(() => dataSource.fetchAnimeInfo(animeId: animeId));
  }

  @override
  Future<Either<Failure, AnimeEpisodeLinksEntity>> fetchEpisodeLinks({required String episodeId}) {
    return _fetch(() => dataSource.fetchEpisodeLinks(episodeId: episodeId)) ;
  }

  @override
  Future<Either<Failure, AnimeSearchResultEntity>> genericSearch({required String uri}) {
    return _fetch(() => dataSource.genericSearch(uri: uri)) ;
  }

  @override
  Future<Either<Failure, AnimeSearchResultEntity>> fetchPopularAnimes({required int page, int pageSize = defaultPageSize}) {
    return _fetch(() => dataSource.fetchPopularAnimes(page: page, pageSize: pageSize));
  }

  @override
  Future<Either<Failure, AnimeSearchResultEntity>> searchAnime({required String query, required int page, int pageSize = defaultPageSize}) {
    return _fetch(() => dataSource.searchAnime(query: query, page: page, pageSize: pageSize));
  }

  @override
  Future<Either<Failure, AnimeSearchResultEntity>> fetchTrendingAnimes({required int page, int pageSize = defaultPageSize}) {
    return _fetch(() => dataSource.fetchTrendingAnimes(page: page, pageSize: pageSize)) ;
  }

  Future<Either<Failure, T>> _fetch<T>(
    Future<T> Function() function
  ) async {
    try {
      final res = await function();
      return Right(res);
    } on Failure catch(e) {
      return Left(e);
    } catch(e) {
      return Left(Failure(message: e.toString()));
    }
  }

}