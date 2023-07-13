import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttaku/core/error/failure.dart';
import 'package:fluttaku/core/interfaces/search_result_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_query_state.dart';

abstract class BaseQueryCubit<T extends SearchResultInterface, P, I> extends Cubit<BaseQueryState<T>> {
  final Future<Either<Failure, T>> Function(P) query;
  final int pageSize;
  BaseQueryCubit({
    required this.query,
    required this.pageSize
  }) : super(BaseQueryLoading<T>());

  int currentPage = 0;
  bool hasMore = true;
  bool isFetching = false;

  List<I> items = [];

  void fetch();
}
