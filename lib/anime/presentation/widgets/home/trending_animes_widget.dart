import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/domain/use_cases/fetch_trending_animes_use_case.dart';
import 'package:fluttaku/anime/presentation/cubits/query_cubit/trending_animes_query_cubit.dart';
import 'package:fluttaku/anime/presentation/widgets/cover_title_widget.dart';
import 'package:fluttaku/core/presentation/widgets/sliver_horizontal_list_view_query_builder.dart';

class TrendingAnimesWidget extends SliverHorizontalListViewQueryBuilder<TrendingAnimesQueryCubit, FetchTrendingAnimesUseCase, AnimePreviewEntity> {
  TrendingAnimesWidget({super.key}) : super(
    title: "Trending Animes",
    itemBuilder: (context, item) {
      return CoverTitleWidget(animePreview: item);
    }
  );
}