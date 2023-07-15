import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/domain/use_cases/fetch_popular_animes_use_case.dart';
import 'package:fluttaku/anime/presentation/cubits/query_cubit/popular_animes_query_cubit.dart';
import 'package:fluttaku/anime/presentation/widgets/banner_preview_widget.dart';
import 'package:fluttaku/core/presentation/widgets/sliver_vertical_list_view_query_builder.dart';

class PopularAnimesWidget extends SliverVerticalListViewQueryBuilder<PopularAnimesQueryCubit, FetchPopularAnimesUseCase, AnimePreviewEntity> {
  PopularAnimesWidget({super.key}) : super(
    itemBuilder: (context, item) {
      return BannerPreviewWidget(animePreview: item);
    }
  );
}