import 'package:fluttaku/anime/data/data_source/remote/anime_remote_data_source.dart';
import 'package:fluttaku/anime/data/models/anime_info_model.dart';
import 'package:fluttaku/anime/data/models/anime_search_result_model.dart';
import 'package:fluttaku/core/error/failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final AnimeRemoteDataSource dataSource = AnimeRemoteDataSource();

  group('search anime', () {
    test('should return a list of anime', () async {
      final result = await dataSource.searchAnime(query: "Kimetsu", page: 1);
      expect(result.runtimeType, AnimeSearchResultModel);
    });

    test('should return an empty list of anime', () async {
      final result = await dataSource.searchAnime(query: "Kimetsu", page: 30);
      expect(result.items.length, 0);
    });
  });

  group('popular anime', () {
    test('should return a list of anime', () async {
      final result = await dataSource.fetchPopularAnimes(page: 1);
      expect(result.runtimeType, AnimeSearchResultModel);
    });
  });

  group('trending anime', () {
    test('should return a list of anime', () async {
      final result = await dataSource.fetchTrendingAnimes(page: 1);
      expect(result.runtimeType, AnimeSearchResultModel);
    });
  });

  group(' anime info', () {
    test('should return anime info', () async {
      final result = await dataSource.fetchAnimeInfo(animeId: '1');
      expect(result.runtimeType, AnimeInfoModel);
    });

    test('should throw error', () async {
      final call = dataSource.fetchAnimeInfo(animeId: 'test');
      expect(() => call, throwsA(const TypeMatcher<Failure>()));
    });
  });

}