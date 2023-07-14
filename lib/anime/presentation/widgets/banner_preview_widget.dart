import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/presentation/widgets/cover_widget.dart';
import 'package:fluttaku/core/config/theme.dart';
import 'package:flutter/material.dart';

class BannerPreviewWidget extends StatelessWidget {
  final AnimePreviewEntity animePreview;
  const BannerPreviewWidget({
    Key? key,
    required this.animePreview
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const double height = 150;

    return Container(
      margin: MyTheme.defaultPadding,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: MyTheme.boxShadow,
        borderRadius: MyTheme.defaultBorderRadius
      ),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [Colors.transparent, Colors.white54, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.45, 1],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: CachedNetworkImage(
              imageUrl: animePreview.bannerImage,
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
    );
  }
}
