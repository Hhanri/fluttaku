part of 'base_query_cubit.dart';

@immutable
abstract class BaseQueryState<I> extends Equatable {
  final SearchResultDisplayMode? displayMode;

  const BaseQueryState({this.displayMode});

  @override
  List<Object?> get props => [displayMode];
}

class BaseQueryLoading<I> extends BaseQueryState<I> {

  const BaseQueryLoading();

  @override
  List<Object?> get props => [];
}

class BaseQuerySuccessState<I> extends BaseQueryState<I> {
  final bool hasMore;
  final SearchResultInterface<I> result;

  const BaseQuerySuccessState({
    required this.result,
    required this.hasMore,
    super.displayMode
  });

  bool isLastItem(int index) {
    return index + 1 == result.items.length;
  }

  @override
  List<Object?> get props => [result, hasMore, displayMode];
}

class BaseQueryErrorState<I> extends BaseQueryState<I> {
  final Failure failure;

  const BaseQueryErrorState({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class BaseQueryNoInputState<I> extends BaseQueryState<I> {

  const BaseQueryNoInputState({super.displayMode});

  @override
  List<Object?> get props => [displayMode];
}