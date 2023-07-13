import 'package:equatable/equatable.dart';
import 'package:fluttaku/core/constants/default_page_size.dart';

class QueryParams extends Equatable {

  final int page;
  final int pageSize;

  const QueryParams({required this.page, this.pageSize = defaultPageSize});

  @override
  List<Object?> get props => [page, pageSize];
}

class SearchQueryParams extends QueryParams {
  final String query;

  const SearchQueryParams({
    required this.query,
    required super.page,
    required super.pageSize
  });

  @override
  List<Object?> get props => [page, pageSize, query];
}