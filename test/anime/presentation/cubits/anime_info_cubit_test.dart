import 'package:fluttaku/anime/data/data_source/remote/anime_remote_data_source.dart';
import 'package:fluttaku/anime/data/models/anime_preview_model.dart';
import 'package:fluttaku/anime/data/models/anime_title_model.dart';
import 'package:fluttaku/anime/data/repository/anime_api_repository_implementation.dart';
import 'package:fluttaku/anime/domain/use_cases/fetch_anime_info_use_case.dart';
import 'package:fluttaku/anime/presentation/cubits/anime_info_cubit/anime_info_cubit.dart';
import 'package:fluttaku/core/interfaces/airing_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final dataSource = AnimeRemoteDataSource();
  final repo = AnimeApiRepositoryImpl(dataSource);
  final fetchAnimeInfoUseCase = FetchAnimeInfoUseCase(repo);
  
  final animePreview = AnimePreviewModel(
    id: '1',
    title: AnimeTitleModel(romaji: 'Cowboy Bebop', english: 'Cowboy Bebop', native: 'カウボーイビバップ'),
    status: AiringStatus.completed,
    coverImage: 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx1-CXtrrkMpJ8Zq.png',
    bannerImage: "https://s4.anilist.co/file/anilistcdn/media/anime/banner/1-OquNCNB6srGe.jpg",
    type: "TV",
    rating: 86,
    genres: ['Action', 'Adventure', 'Drama', 'Sci-Fi'],
    totalEpisodes: 26,
    currentEpisodesCount: 26
  );



  group('anime info cubit', () {
    late AnimeInfoCubit animeInfoCubit;

    setUp(() {
      animeInfoCubit = AnimeInfoCubit(animePreview: animePreview, useCase: fetchAnimeInfoUseCase);
    });

    tearDown(() => animeInfoCubit.close());

    test('initial state should be loading', () {
      expect(animeInfoCubit.state.runtimeType, AnimeInfoLoading);
      expect(animeInfoCubit.state.navBarState, AnimeInfoNavBarState.details);
    });

    test('should emit anime info loaded state', () async {
      await animeInfoCubit.init();
      expect(animeInfoCubit.state.runtimeType, AnimeInfoLoaded);
    });

    test('should change nav bar state to watch', () {
      animeInfoCubit.changeNavBarState(newState: AnimeInfoNavBarState.watch);
      expect(animeInfoCubit.navBarState, AnimeInfoNavBarState.watch);
      expect(animeInfoCubit.state.navBarState, AnimeInfoNavBarState.watch);
    });

    test('should change nav bar state to details', () {
      animeInfoCubit.changeNavBarState(newState: AnimeInfoNavBarState.details);
      expect(animeInfoCubit.navBarState, AnimeInfoNavBarState.details);
      expect(animeInfoCubit.state.navBarState, AnimeInfoNavBarState.details);
    });
  });

}