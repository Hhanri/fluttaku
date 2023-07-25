import 'package:fluttaku/anime/data/data_source/remote/anime_remote_data_source.dart';
import 'package:fluttaku/anime/data/repository/anime_api_repository_implementation.dart';
import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/domain/use_cases/search_anime_use_case.dart';
import 'package:fluttaku/anime/presentation/cubits/search_query_cubit/anime_search_query_cubit.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_query_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final dataSource = AnimeRemoteDataSource();
  final repo = AnimeApiRepositoryImpl(dataSource);
  final searchAnimeUseCase = SearchAnimeUseCase(repo);

  final searchQueryCubit = AnimeSearchQueryCubit(useCase: searchAnimeUseCase, pageSize: 3);

  group('search anime query cubit', () {

    test('initial state should be no input', () {
      expect(searchQueryCubit.state.runtimeType, BaseQueryNoInputState<Never>);
      expect(searchQueryCubit.items.length, 0);
    });

    test('empty first search', () async {
      await searchQueryCubit.search();
      expect(searchQueryCubit.state.runtimeType, BaseQueryNoInputState<Never>);
    });

    test('search kimetsu should return list of anime previews', () async {
      searchQueryCubit.textController.text = 'Kimetsu';
      await searchQueryCubit.search();
      expect(searchQueryCubit.state.runtimeType, BaseQuerySuccessState<AnimePreviewEntity>);
      expect(searchQueryCubit.items.isNotEmpty, true);
    });

    test('search kimetsu should return list of anime previews, then fetch more', () async {
      searchQueryCubit.textController.text = 'Kimetsu';
      await searchQueryCubit.search();
      expect(searchQueryCubit.state.runtimeType, BaseQuerySuccessState<AnimePreviewEntity>);
      expect(searchQueryCubit.items.isNotEmpty, true);
      expect(searchQueryCubit.items.length, 3);

      await searchQueryCubit.fetchMore();
      expect(searchQueryCubit.state.runtimeType, BaseQuerySuccessState<AnimePreviewEntity>);
      expect(searchQueryCubit.items.isNotEmpty, true);
      expect(searchQueryCubit.items.length, 6);
    });

    // test('fetch 10 by 10', () async {
    //   await searchQueryCubit.fetchMore();
    //   expect(searchQueryCubit.state.runtimeType, BaseQuerySuccessState<AnimePreviewEntity>);
    //   expect(searchQueryCubit.items.length, 10);
    //
    //   await searchQueryCubit.fetchMore();
    //   expect(searchQueryCubit.state.runtimeType, BaseQuerySuccessState<AnimePreviewEntity>);
    //   expect(searchQueryCubit.items.length, 20);
    // });
  });

}