import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttaku/core/error/failure.dart';
import 'package:fluttaku/core/interfaces/search_result_interface.dart';
import 'package:fluttaku/core/utils/anime_query_params.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_query_state.dart';

abstract class BaseQueryCubit<I> extends Cubit<BaseQueryState<I>> {
  final Future<Either<Failure, SearchResultInterface<I>>> Function(AnimeQueryParams) query;
  final int pageSize;
  BaseQueryCubit({
    required this.query,
    required this.pageSize
  }) : super(BaseQueryLoading<I>());

  int currentPage = 0;
  bool hasMore = true;
  bool isFetching = false;

  List<I> items = [];

  void fetch();
}
