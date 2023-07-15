import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/domain/use_cases/search_anime_use_case.dart';
import 'package:fluttaku/anime/presentation/cubits/search_query_cubit/anime_search_query_cubit.dart';
import 'package:fluttaku/anime/presentation/widgets/banner_preview_widget.dart';
import 'package:fluttaku/anime/presentation/widgets/cover_title_widget.dart';
import 'package:fluttaku/anime/presentation/widgets/text_fields/search_anime_text_field.dart';
import 'package:fluttaku/core/presentation/widgets/search_screen_builder.dart';

class SearchAnimeScreen extends SearchScreenBuilder<AnimeSearchQueryCubit, SearchAnimeUseCase, AnimePreviewEntity> {
  SearchAnimeScreen({super.key}) : super(
    gridItemBuilder: (context, item) => CoverTitleWidget(animePreview: item),
    listItemBuilder: (context, item) => BannerPreviewWidget(animePreview: item),
    textFieldBuilder: (controller, onSearch) {
      return SearchAnimeTextField(
        controller: controller,
        onSearch: onSearch,
        onFieldSubmitted: (value) => onSearch(),
      );
    }
  );
}