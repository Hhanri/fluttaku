import 'package:dartz/dartz.dart';
import 'package:fluttaku/anime/data/data_source/remote/anime_remote_data_source.dart';
import 'package:fluttaku/anime/data/repository/anime_api_repository_implementation.dart';
import 'package:fluttaku/anime/domain/entities/anime_search_result_entity.dart';
import 'package:fluttaku/anime/domain/use_cases/search_anime_use_case.dart';
import 'package:fluttaku/core/error/failure.dart';
import 'package:fluttaku/core/utils/anime_query_params.dart';
import 'package:fluttaku/episode/data/data_source/remote/episode_remote_data_source.dart';
import 'package:fluttaku/episode/data/repository/episode_api_repository_implementation.dart';
import 'package:fluttaku/episode/domain/use_cases/fetch_episode_links.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final FetchEpisodeLinksUseCase useCase = FetchEpisodeLinksUseCase(
    EpisodeApiRepositoryImpl(
      EpisodeRemoteDataSource()
    )
  );

  group('fetch episode links', () {
    test('should return episode links', () async {
      final result = await useCase.call('cowboy-bebop-episode-1');
      expect(result.isRight(), true);
    });

    test('should return failure', () async {
      final result = await useCase.call('cowboy-bebop-episode-0');
      expect(result.isRight(), false);
    });
  });
}