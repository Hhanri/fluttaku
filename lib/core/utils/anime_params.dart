import 'package:equatable/equatable.dart';
import 'package:fluttaku/core/constants/default_page_size.dart';

class AnimeParams extends Equatable {

  final int page;
  final int pageSize;

  const AnimeParams({required this.page, this.pageSize = defaultPageSize});

  @override
  List<Object?> get props => [page, pageSize];
}

class AnimeQueryParams extends AnimeParams {
  final String query;

  const AnimeQueryParams({
    required this.query,
    required super.page,
    required super.pageSize
  });

  @override
  List<Object?> get props => [page, pageSize, query];
}