import 'package:fluttaku/anime/data/data_source/anime_data_source_interface.dart';
import 'package:fluttaku/anime/data/data_source/remote/anime_remote_data_source.dart';
import 'package:fluttaku/anime/data/repository/anime_api_repository_implementation.dart';
import 'package:fluttaku/anime/domain/repository/anime_api_repository_interface.dart';
import 'package:fluttaku/anime/domain/use_cases/fetch_popular_animes_use_case.dart';
import 'package:fluttaku/anime/domain/use_cases/fetch_trending_animes_use_case.dart';
import 'package:fluttaku/anime/presentation/cubits/query_cubit/popular_animes_query_cubit.dart';
import 'package:fluttaku/anime/presentation/cubits/query_cubit/trending_animes_query_cubit.dart';
import 'package:fluttaku/core/constants/default_page_size.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.asNewInstance();

void setupSL() {
  //setup datasource
  sl.registerLazySingleton<AnimeDataSourceInterface>(() => AnimeRemoteDataSource());

  //setup repo
  sl.registerLazySingleton<AnimeAPIRepositoryInterface>(() => AnimeApiRepositoryImpl(sl.get<AnimeDataSourceInterface>()));

  //setup use cases
  sl.registerLazySingleton<FetchPopularAnimesUseCase>(() => FetchPopularAnimesUseCase(sl.get<AnimeAPIRepositoryInterface>()));
  sl.registerLazySingleton<FetchTrendingAnimesUseCase>(() => FetchTrendingAnimesUseCase(sl.get<AnimeAPIRepositoryInterface>()));

  //setup cubits
  sl.registerFactory<TrendingAnimesQueryCubit>(() => TrendingAnimesQueryCubit(useCase: sl.get<FetchTrendingAnimesUseCase>(), pageSize: defaultPageSize)..fetch());
  sl.registerFactory<PopularAnimesQueryCubit>(() => PopularAnimesQueryCubit(useCase: sl.get<FetchPopularAnimesUseCase>(), pageSize: defaultPageSize)..fetch());
}