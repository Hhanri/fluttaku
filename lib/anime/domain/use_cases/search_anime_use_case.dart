import 'package:dartz/dartz.dart';
import 'package:fluttaku/anime/domain/entities/anime_search_result_entity.dart';
import 'package:fluttaku/anime/domain/repository/anime_api_repository_interface.dart';
import 'package:fluttaku/core/error/failure.dart';
import 'package:fluttaku/core/use_cases/use_case.dart';
import 'package:fluttaku/core/utils/anime_query_params.dart';

class SearchAnimeUseCase extends UseCase<AnimeSearchResultEntity, SearchQueryParams> {

  final AnimeAPIRepositoryInterface apiRepo;

  SearchAnimeUseCase(this.apiRepo);

  @override
  Future<Either<Failure, AnimeSearchResultEntity>> call(SearchQueryParams params) {
    return apiRepo.searchAnime(query:params.query, page: params.page, pageSize: params.pageSize);
  }
}