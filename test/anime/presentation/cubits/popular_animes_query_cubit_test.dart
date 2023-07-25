import 'package:fluttaku/anime/data/data_source/remote/anime_remote_data_source.dart';
import 'package:fluttaku/anime/data/repository/anime_api_repository_implementation.dart';
import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/domain/use_cases/fetch_popular_animes_use_case.dart';
import 'package:fluttaku/anime/presentation/cubits/query_cubit/popular_animes_query_cubit.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_query_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final dataSource = AnimeRemoteDataSource();
  final repo = AnimeApiRepositoryImpl(dataSource);
  final fetchPopularAnimesUseCase = FetchPopularAnimesUseCase(repo);

  final popularAnimesQueryCubit = PopularAnimesQueryCubit(useCase: fetchPopularAnimesUseCase, pageSize: 10);

  group('popular animes query cubit', () {

    test('initial state should be loading', () {
      expect(popularAnimesQueryCubit.state.runtimeType, BaseQueryLoading<Never>);
      expect(popularAnimesQueryCubit.items.length, 0);
    });

    test('fetch 10 by 10', () async {
      await popularAnimesQueryCubit.fetchMore();
      expect(popularAnimesQueryCubit.state.runtimeType, BaseQuerySuccessState<AnimePreviewEntity>);
      expect(popularAnimesQueryCubit.items.length, 10);

      await popularAnimesQueryCubit.fetchMore();
      expect(popularAnimesQueryCubit.state.runtimeType, BaseQuerySuccessState<AnimePreviewEntity>);
      expect(popularAnimesQueryCubit.items.length, 20);
    });
  });

}