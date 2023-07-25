import 'package:fluttaku/anime/data/data_source/remote/anime_remote_data_source.dart';
import 'package:fluttaku/anime/data/repository/anime_api_repository_implementation.dart';
import 'package:fluttaku/anime/domain/use_cases/fetch_trending_animes_use_case.dart';
import 'package:fluttaku/core/utils/anime_query_params.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final FetchTrendingAnimesUseCase useCase = FetchTrendingAnimesUseCase(
    AnimeApiRepositoryImpl(
      AnimeRemoteDataSource()
    )
  );

  group('fetch trending animes', () {
    test('should return success', () async {
      final result = await useCase.call(const QueryParams(page: 1));
      expect(result.isRight(), true);
    });
  });
}