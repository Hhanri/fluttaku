part of 'base_query_cubit.dart';

@immutable
abstract class BaseQueryState<I> extends Equatable {}

class BaseQueryLoading<I> extends BaseQueryState<I> {
  @override
  List<Object?> get props => [];
}

class BaseQuerySuccessState<I> extends BaseQueryState<I> {
  final bool hasMore;
  final SearchResultInterface<I> result;

  BaseQuerySuccessState({required this.result, required this.hasMore});

  bool isLastItem(int index) {
    return index + 1 == result.items.length;
  }

  @override
  List<Object?> get props => [result];
}

class BaseQueryErrorState<I> extends BaseQueryState<I> {
  final Failure failure;

  BaseQueryErrorState({required this.failure});

  @override
  List<Object?> get props => [failure];
}
