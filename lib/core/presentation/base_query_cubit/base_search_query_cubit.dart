import 'package:fluttaku/core/interfaces/search_result_interface.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_query_cubit.dart';
import 'package:fluttaku/core/use_cases/use_case.dart';
import 'package:fluttaku/core/utils/anime_query_params.dart';
import 'package:flutter/material.dart';

abstract class BaseSearchQueryCubit<U extends UseCase<SearchResultInterface<I>, QueryParams>, I> extends BaseQueryCubit<U, I> {

  final TextEditingController textController = TextEditingController();
  String query = "";

  BaseSearchQueryCubit({required super.useCase, required super.pageSize});

  @override
  void fetchMore();

  void search();

  @override
  Future<void> close() async {
    textController.dispose();
    super.close();
  }
}