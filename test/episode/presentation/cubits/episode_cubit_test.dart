import 'package:fluttaku/episode/data/data_source/remote/episode_remote_data_source.dart';
import 'package:fluttaku/episode/data/models/episode_info_model.dart';
import 'package:fluttaku/episode/data/repository/episode_api_repository_implementation.dart';
import 'package:fluttaku/episode/domain/use_cases/fetch_episode_links.dart';
import 'package:fluttaku/episode/presentation/cubits/episode_cubit/episode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp());

  final dataSource = EpisodeRemoteDataSource();
  final repo = EpisodeApiRepositoryImpl(dataSource);
  final fetchEpisodeLinksUseCase = FetchEpisodeLinksUseCase(repo);

  final episodeInfo = EpisodeInfoModel(
      id: 'cowboy-bebop-episode-1',
      title: 'Asteroid Blues',
      description: 'Spike and Jet head to Tijuana to track down an outlaw smuggling a dangerous drug known as blood-eye. Jet wants the bounty, but Spike has eyes for a far prettier prize.',
      number: 1,
      thumbnail: 'https://artworks.thetvdb.com/banners/episodes/76885/219120.jpg'
  );

  final episodeCubit = EpisodeCubit(episodeInfo: episodeInfo, useCase: fetchEpisodeLinksUseCase);

  group('episode cubit', () {

    test('initial state should be', () {
      expect(episodeCubit.state.runtimeType, EpisodeLoadingState);
    });
    
  });
}