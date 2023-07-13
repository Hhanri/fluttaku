import 'package:fluttaku/anime/domain/use_cases/fetch_popular_animes_use_case.dart';
import 'package:fluttaku/anime/presentation/cubits/query_cubit/animes_query_cubit.dart';

class PopularAnimesQueryCubit extends AnimesQueryCubit<FetchPopularAnimesUseCase> {
  PopularAnimesQueryCubit({required super.useCase, required super.pageSize});
}