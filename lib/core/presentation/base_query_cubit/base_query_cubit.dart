import 'package:equatable/equatable.dart';
import 'package:fluttaku/core/error/failure.dart';
import 'package:fluttaku/core/interfaces/search_result_interface.dart';
import 'package:fluttaku/core/presentation/base_query_cubit/base_search_query_cubit.dart';
import 'package:fluttaku/core/use_cases/use_case.dart';
import 'package:fluttaku/core/utils/anime_query_params.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_query_state.dart';

abstract class BaseQueryCubit<U extends UseCase<SearchResultInterface<I>, QueryParams>, I> extends Cubit<BaseQueryState<I>> {
  final U useCase;
  final int pageSize;
  final BaseQueryState<I> initialState;
  BaseQueryCubit({
    required this.useCase,
    required this.pageSize,
    this.initialState = const BaseQueryLoading()
  } ) : super(initialState);

  int currentPage = 0;
  bool hasMore = true;
  bool isFetching = false;

  List<I> items = [];

  Future<void> fetchMore();
}
