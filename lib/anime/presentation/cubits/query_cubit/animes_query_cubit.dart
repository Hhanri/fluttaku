import 'package:fluttaku/anime/data/models/anime_search_result_model.dart';
import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_search_result_entity.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_query_cubit.dart';
import 'package:fluttaku/core/use_cases/use_case.dart';
import 'package:fluttaku/core/utils/anime_query_params.dart';

abstract class AnimesQueryCubit<U extends UseCase<AnimeSearchResultEntity, QueryParams>> extends BaseQueryCubit<U, AnimePreviewEntity> {

  AnimesQueryCubit({
    required super.useCase,
    required super.pageSize
  });

  @override
  Future<void> fetchMore() async {
    if (!hasMore || isFetching) return;

    final result = await useCase.call(QueryParams(page: currentPage + 1, pageSize: pageSize));
    isFetching = false;

    result.fold(
      (error) {
        //emit(BaseQueryErrorState(failure: error));
      },
      (success) {
        currentPage++;
        hasMore = success.hasNextPage;
        items = [...items, ...success.items];

        final searchResult = AnimeSearchResultModel(
          hasNextPage: hasMore,
          currentPage: currentPage,
          items: items
        );

        emit(BaseQuerySuccessState(result: searchResult, hasMore: hasMore));
      }
    );
  }
}