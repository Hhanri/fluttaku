import 'package:dartz/dartz.dart';
import 'package:fluttaku/anime/domain/entities/anime_episode_links_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_info_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_search_result_entity.dart';
import 'package:fluttaku/core/constants/default_page_size.dart';
import 'package:fluttaku/core/error/failure.dart';

abstract class AnimeAPIRepositoryInterface {

  Future<Either<Failure, AnimeSearchResultEntity>> genericSearch({required String uri});

  Future<Either<Failure, AnimeSearchResultEntity>> searchAnime({required String query, required int page, int pageSize = defaultPageSize});

  Future<Either<Failure, AnimeSearchResultEntity>> fetchPopularAnimes({required int page, int pageSize = defaultPageSize});

  Future<Either<Failure, AnimeSearchResultEntity>> fetchTrendingAnimes({required int page, int pageSize = defaultPageSize});

  Future<Either<Failure,AnimeInfoEntity>> fetchAnimeInfo({required String animeId});

  Future<Either<Failure,AnimeEpisodeLinksEntity>> fetchEpisodeLinks({required String episodeId});

}