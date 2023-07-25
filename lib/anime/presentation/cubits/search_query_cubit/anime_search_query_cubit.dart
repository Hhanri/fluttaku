import 'package:fluttaku/anime/data/models/anime_search_result_model.dart';
import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/domain/use_cases/search_anime_use_case.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_query_cubit.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_search_query_cubit.dart';
import 'package:fluttaku/core/utils/anime_query_params.dart';

class AnimeSearchQueryCubit extends BaseSearchQueryCubit<SearchAnimeUseCase, AnimePreviewEntity> {

  AnimeSearchQueryCubit({
    required super.useCase,
    required super.pageSize
  });

  @override
  void changeDisplayMode(SearchResultDisplayMode displayMode) {
    super.displayMode = displayMode;

    if (state is BaseQueryNoInputState) {
      emit(BaseQueryNoInputState(displayMode: displayMode));
      return;
    }

    emitNotLoading();
  }

  @override
  Future<void> fetchMore() async {
    if (!hasMore || isFetching) return;

    final result = await useCase.call(
      SearchQueryParams(
        query: query,
        page: currentPage + 1,
        pageSize: pageSize
      )
    );
    isFetching = false;

    result.fold(
      (error) {
        //emit(BaseQueryErrorState(failure: error));
      },
      (success) {
        currentPage++;
        hasMore = success.hasNextPage;
        items = [...items, ...success.items];

        emitNotLoading();
      }
    );
  }

  @override
  Future<void> search() async {
    if (query == textController.text || textController.text.trim().isEmpty) return;
    query = textController.text;
    hasMore = true;
    currentPage = 0;

    final result = await useCase.call(
      SearchQueryParams(
        query: query,
        page: currentPage + 1,
        pageSize: pageSize
      )
    );
    isFetching = false;

    result.fold(
      (error) {
        emit(BaseQueryErrorState(failure: error));
      },
      (success) {
        currentPage++;
        hasMore = success.hasNextPage;
        items = success.items;

        emitNotLoading();
      }
    );
  }

  void emitNotLoading() {
    final searchResult = AnimeSearchResultModel(
      hasNextPage: hasMore,
      currentPage: currentPage,
      items: items,
    );

    emit(
      BaseQuerySuccessState(
        result: searchResult,
        hasMore: hasMore,
        displayMode: displayMode
      )
    );
  }
}