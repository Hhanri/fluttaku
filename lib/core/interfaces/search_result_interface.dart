abstract class SearchResultInterface<T> {
  final bool hasNextPage;
  final int currentPage;
  final List<T> items;

  SearchResultInterface({
    required this.hasNextPage,
    required this.currentPage,
    required this.items
  });

  SearchResultInterface copyWith({
    bool? hasNextPage,
    int? currentPage,
    List<T>? items
  });
}