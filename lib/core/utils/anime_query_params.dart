import 'package:equatable/equatable.dart';
import 'package:fluttaku/core/constants/default_page_size.dart';

class AnimeQueryParams extends Equatable {

  final int page;
  final int pageSize;

  const AnimeQueryParams({required this.page, this.pageSize = defaultPageSize});

  @override
  List<Object?> get props => [page, pageSize];
}

class AnimeSearchParams extends AnimeQueryParams {
  final String query;

  const AnimeSearchParams({
    required this.query,
    required super.page,
    required super.pageSize
  });

  @override
  List<Object?> get props => [page, pageSize, query];
}