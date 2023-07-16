import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/presentation/widgets/cover_widget.dart';
import 'package:fluttaku/core/config/router.dart';
import 'package:fluttaku/core/config/theme.dart';
import 'package:fluttaku/core/presentation/widgets/gradient_mask_shader.dart';
import 'package:fluttaku/core/utils/media_query.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BannerPreviewWidget extends StatelessWidget {
  final AnimePreviewEntity animePreview;
  const BannerPreviewWidget({
    Key? key,
    required this.animePreview
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => GoRouter.of(context).pushNamed(MyGoRouter.animeRouteName, extra: animePreview),
      child: Container(
        margin: MyTheme.defaultAsymmetricPadding,
        height: MediaQueryHelper.height(context, 0.25),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: MyTheme.boxShadow,
          borderRadius: MyTheme.defaultBorderRadius
        ),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            WhiteGradientShaderMask(
              child: CachedNetworkImage(
                imageUrl: animePreview.bannerImage ?? animePreview.coverImage,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                CoverWidget(
                  padding: MyTheme.defaultPadding,
                  imageUrl: animePreview.coverImage,
                  rating: animePreview.rating,
                  isAiring: animePreview.isAiring
                ),
                Flexible(
                  child: Padding(
                    padding: MyTheme.defaultPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          animePreview.title.romaji,
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          style: MyTextStyle.titleBoldStyle,
                        ),
                        Text("${animePreview.totalEpisodes} episodes")
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
