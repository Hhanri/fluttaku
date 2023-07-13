part of 'base_query_cubit.dart';

@immutable
abstract class BaseQueryState<T extends SearchResultInterface> extends Equatable {}

class BaseQueryLoading<T extends SearchResultInterface> extends BaseQueryState<T> {
  @override
  List<Object?> get props => [];
}

class BaseQuerySuccessState<T extends SearchResultInterface> extends BaseQueryState<T> {
  final bool hasMore;
  final T result;

  BaseQuerySuccessState({required this.result, required this.hasMore});

  bool isLastItem(int index) {
    return index + 1 == result.items.length;
  }

  @override
  List<Object?> get props => [result];
}

class BaseQueryErrorState<T extends SearchResultInterface> extends BaseQueryState<T> {
  final Failure failure;

  BaseQueryErrorState({required this.failure});

  @override
  List<Object?> get props => [failure];
}
