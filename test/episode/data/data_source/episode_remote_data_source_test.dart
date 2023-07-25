import 'package:fluttaku/core/error/failure.dart';
import 'package:fluttaku/episode/data/data_source/remote/episode_remote_data_source.dart';
import 'package:fluttaku/episode/data/models/episode_links_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final EpisodeRemoteDataSource dataSource = EpisodeRemoteDataSource();

  group('episode', () {
    test('should return episode links', () async {
      final result = await dataSource.fetchEpisodeLinks(episodeId: 'cowboy-bebop-episode-1');
      expect(result.runtimeType, EpisodeLinksModel);
    });

    test('should throw error', () async {
      final call = dataSource.fetchEpisodeLinks(episodeId: 'cowboy-bebop-episode-0');
      expect(() => call, throwsA(const TypeMatcher<Failure>()));
    });
  });
}