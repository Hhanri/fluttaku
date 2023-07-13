import 'package:fluttaku/anime/data/models/anime_search_result_model.dart';
import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_search_result_entity.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_query_cubit.dart';
import 'package:fluttaku/core/use_cases/use_case.dart';
import 'package:fluttaku/core/utils/anime_query_params.dart';
import 'package:flutter/cupertino.dart';

abstract class SearchQueryCubit<U extends UseCase<AnimeSearchResultEntity, SearchQueryParams>> extends BaseQueryCubit<U, AnimePreviewEntity> {

  final TextEditingController textController = TextEditingController();
  String query = "";

  SearchQueryCubit({
    required super.useCase,
    required super.pageSize
  });

  @override
  void fetch() async {
    if (!hasMore || isFetching) return;

    final result = await useCase.call(
      SearchQueryParams(
        query: textController.text,
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

  void search() {
    if (query == textController.text) return;
    query = textController.text;
    fetch();
  }

  @override
  Future<void> close() async {
    textController.dispose();
    super.close();
  }
}