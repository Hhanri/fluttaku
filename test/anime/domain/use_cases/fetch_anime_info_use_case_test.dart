import 'package:fluttaku/anime/data/data_source/remote/anime_remote_data_source.dart';
import 'package:fluttaku/anime/data/repository/anime_api_repository_implementation.dart';
import 'package:fluttaku/anime/domain/use_cases/fetch_anime_info_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final FetchAnimeInfoUseCase useCase = FetchAnimeInfoUseCase(
    AnimeApiRepositoryImpl(
      AnimeRemoteDataSource()
    )
  );

  group('fetch anime info', () {
    test('should return success', () async {
      final result = await useCase.call('1');
      expect(result.isRight(), true);
    });

    test('should return failure', () async {
      final result = await useCase.call('test');
      expect(result.isRight(), false);
    });
  });
}