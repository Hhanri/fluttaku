import 'package:fluttaku/anime/data/data_source/anime_data_source_interface.dart';
import 'package:fluttaku/anime/data/data_source/remote/anime_remote_data_source.dart';
import 'package:fluttaku/anime/data/repository/anime_api_repository_implementation.dart';
import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/domain/repository/anime_api_repository_interface.dart';
import 'package:fluttaku/anime/domain/use_cases/fetch_anime_info_use_case.dart';
import 'package:fluttaku/episode/data/data_source/episode_data_source_interface.dart';
import 'package:fluttaku/episode/data/data_source/remote/episode_remote_data_source.dart';
import 'package:fluttaku/episode/data/repository/episode_api_repository_implementation.dart';
import 'package:fluttaku/episode/domain/repository/episode_api_repository_interface.dart';
import 'package:fluttaku/episode/domain/use_cases/fetch_episode_links.dart';
import 'package:fluttaku/anime/domain/use_cases/fetch_popular_animes_use_case.dart';
import 'package:fluttaku/anime/domain/use_cases/fetch_trending_animes_use_case.dart';
import 'package:fluttaku/anime/domain/use_cases/search_anime_use_case.dart';
import 'package:fluttaku/anime/presentation/cubits/anime_info_cubit/anime_info_cubit.dart';
import 'package:fluttaku/anime/presentation/cubits/query_cubit/popular_animes_query_cubit.dart';
import 'package:fluttaku/anime/presentation/cubits/query_cubit/trending_animes_query_cubit.dart';
import 'package:fluttaku/anime/presentation/cubits/search_query_cubit/anime_search_query_cubit.dart';
import 'package:fluttaku/core/config/router.dart';
import 'package:fluttaku/core/constants/default_page_size.dart';
import 'package:fluttaku/episode/domain/entities/episode_info_entity.dart';
import 'package:fluttaku/episode/presentation/cubits/episode_cubit/episode_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.asNewInstance();

void setupSL() {
  //router
  sl.registerLazySingleton<MyGoRouter>(() => MyGoRouter());

  //setup datasource
  sl.registerLazySingleton<AnimeDataSourceInterface>(() => AnimeRemoteDataSource());
  sl.registerLazySingleton<EpisodeDataSourceInterface>(() => EpisodeRemoteDataSource());

  //setup repo
  sl.registerLazySingleton<AnimeAPIRepositoryInterface>(() => AnimeApiRepositoryImpl(sl.get<AnimeDataSourceInterface>()));
  sl.registerLazySingleton<EpisodeAPIRepositoryInterface>(() => EpisodeApiRepositoryImpl(sl.get<EpisodeDataSourceInterface>()));

  //setup use cases
  sl.registerLazySingleton<FetchPopularAnimesUseCase>(() => FetchPopularAnimesUseCase(sl.get<AnimeAPIRepositoryInterface>()));
  sl.registerLazySingleton<FetchTrendingAnimesUseCase>(() => FetchTrendingAnimesUseCase(sl.get<AnimeAPIRepositoryInterface>()));
  sl.registerLazySingleton<SearchAnimeUseCase>(() => SearchAnimeUseCase(sl.get<AnimeAPIRepositoryInterface>()));
  sl.registerLazySingleton<FetchAnimeInfoUseCase>(() => FetchAnimeInfoUseCase(sl.get<AnimeAPIRepositoryInterface>()));
  sl.registerLazySingleton<FetchEpisodeLinksUseCase>(() => FetchEpisodeLinksUseCase(sl.get<EpisodeAPIRepositoryInterface>()));

  //setup cubits
  sl.registerFactory<TrendingAnimesQueryCubit>(() => TrendingAnimesQueryCubit(useCase: sl.get<FetchTrendingAnimesUseCase>(), pageSize: defaultPageSize)..fetchMore());
  sl.registerFactory<PopularAnimesQueryCubit>(() => PopularAnimesQueryCubit(useCase: sl.get<FetchPopularAnimesUseCase>(), pageSize: defaultPageSize)..fetchMore());
  sl.registerFactory<AnimeSearchQueryCubit>(() => AnimeSearchQueryCubit(useCase: sl.get<SearchAnimeUseCase>(), pageSize: defaultPageSize));
  sl.registerFactoryParam<AnimeInfoCubit, AnimePreviewEntity, dynamic>((param1, _) => AnimeInfoCubit(animePreview: param1, useCase: sl.get<FetchAnimeInfoUseCase>()));
  sl.registerFactoryParam<EpisodeCubit, EpisodeInfoEntity, dynamic>((param1, _) => EpisodeCubit(episodeInfo: param1, useCase: sl.get<FetchEpisodeLinksUseCase>()));
}