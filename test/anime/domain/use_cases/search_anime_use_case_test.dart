import 'package:dartz/dartz.dart';
import 'package:fluttaku/anime/data/data_source/remote/anime_remote_data_source.dart';
import 'package:fluttaku/anime/data/repository/anime_api_repository_implementation.dart';
import 'package:fluttaku/anime/domain/entities/anime_search_result_entity.dart';
import 'package:fluttaku/anime/domain/use_cases/search_anime_use_case.dart';
import 'package:fluttaku/core/error/failure.dart';
import 'package:fluttaku/core/utils/anime_query_params.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final SearchAnimeUseCase useCase = SearchAnimeUseCase(
    AnimeApiRepositoryImpl(
      AnimeRemoteDataSource()
    )
  );

  group('search anime', () {
    test('should return list of animes', () async {
      final result = await useCase.call(const SearchQueryParams(query: 'Kimetsu', page: 1, pageSize: 10));
      expect(result.isRight(), true);
    });

    test('should return an empty list of animes', () async {
      final result = await useCase.call(const SearchQueryParams(query: 'Kimetsu', page: 30, pageSize: 10));
      expect(result.isRight() ? (result as Right<Failure, AnimeSearchResultEntity>).value.items.length : null, 0);
    });
  });
}