import 'package:fluttaku/anime/domain/use_cases/fetch_trending_animes_use_case.dart';
import 'package:fluttaku/anime/presentation/cubits/query_cubit/animes_query_cubit.dart';

class TrendingAnimesQueryCubit extends AnimesQueryCubit<FetchTrendingAnimesUseCase> {
  TrendingAnimesQueryCubit({required super.useCase, required super.pageSize});
}