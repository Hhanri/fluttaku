import 'package:fluttaku/anime/data/data_source/remote/anime_remote_data_source.dart';
import 'package:fluttaku/anime/data/repository/anime_api_repository_implementation.dart';
import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/domain/use_cases/fetch_trending_animes_use_case.dart';
import 'package:fluttaku/anime/presentation/cubits/query_cubit/trending_animes_query_cubit.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_query_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final dataSource = AnimeRemoteDataSource();
  final repo = AnimeApiRepositoryImpl(dataSource);
  final fetchTrendingAnimesUseCase = FetchTrendingAnimesUseCase(repo);

  group('trending animes query cubit', () {

    late TrendingAnimesQueryCubit trendingAnimesQueryCubit;

    setUp(() {
      trendingAnimesQueryCubit = TrendingAnimesQueryCubit(useCase: fetchTrendingAnimesUseCase, pageSize: 10);
    });

    tearDown(() => trendingAnimesQueryCubit.close());

    test('initial state should be loading', () {
      expect(trendingAnimesQueryCubit.state.runtimeType, BaseQueryLoading<Never>);
      expect(trendingAnimesQueryCubit.items.length, 0);
    });

    test('fetch 10 by 10', () async {
      await trendingAnimesQueryCubit.fetchMore();
      expect(trendingAnimesQueryCubit.state.runtimeType, BaseQuerySuccessState<AnimePreviewEntity>);
      expect(trendingAnimesQueryCubit.items.length, 10);

      await trendingAnimesQueryCubit.fetchMore();
      expect(trendingAnimesQueryCubit.state.runtimeType, BaseQuerySuccessState<AnimePreviewEntity>);
      expect(trendingAnimesQueryCubit.items.length, 20);
    });
  });

}