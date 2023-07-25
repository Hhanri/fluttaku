import 'package:fluttaku/core/interfaces/search_result_interface.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_query_cubit.dart';
import 'package:fluttaku/core/use_cases/use_case.dart';
import 'package:fluttaku/core/utils/anime_query_params.dart';
import 'package:flutter/material.dart';

abstract class BaseSearchQueryCubit<U extends UseCase<SearchResultInterface<I>, QueryParams>, I> extends BaseQueryCubit<U, I> {

  final TextEditingController textController = TextEditingController();
  String query = "";
  SearchResultDisplayMode displayMode = SearchResultDisplayMode.grid;

  BaseSearchQueryCubit({required super.useCase, required super.pageSize}) : super(initialState: const BaseQueryNoInputState());

  @override
  Future<void> fetchMore();

  Future<void> search();

  void changeDisplayMode(SearchResultDisplayMode displayMode);

  @override
  Future<void> close() async {
    textController.dispose();
    super.close();
  }
}

enum SearchResultDisplayMode {
  grid,
  list
}