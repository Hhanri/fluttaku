import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/presentation/widgets/cover_widget.dart';
import 'package:fluttaku/core/config/theme.dart';
import 'package:flutter/material.dart';

class CoverTitleWidget extends StatelessWidget {
  final AnimePreviewEntity animePreview;
  const CoverTitleWidget({Key? key, required this.animePreview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      margin: MyTheme.defaultPadding,
      height: mediaQuery.size.height*0.3 * mediaQuery.textScaleFactor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: CoverWidget(
              imageUrl: animePreview.coverImage,
              rating: animePreview.rating,
              isAiring: animePreview.isAiring
            ),
          ),
          Expanded(
            child: Text(
              animePreview.title.romaji,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: MyTextStyle.titleStyle,
            ),
          )
        ],
      ),
    );
  }
}