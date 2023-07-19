import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttaku/anime/domain/entities/anime_episode_info_entity.dart';
import 'package:fluttaku/core/config/router.dart';
import 'package:fluttaku/core/config/theme.dart';
import 'package:fluttaku/core/utils/media_query.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EpisodeTileWidget extends StatelessWidget {
  final AnimeEpisodeInfoEntity episode;
  const EpisodeTileWidget({Key? key, required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).pushNamed(MyGoRouter.episodeRouteName, extra: episode),
      child: Container(
        margin: MyTheme.defaultAsymmetricPadding,
        decoration: BoxDecoration(
          borderRadius: MyTheme.defaultBorderRadius,
          color: MyColors.foregroundColor
        ),
        clipBehavior: Clip.hardEdge,
        child: Row(
          children: [
            Expanded(
              child: Container(
                clipBehavior: Clip.hardEdge,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: MyTheme.defaultBorderRadius,
                ),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: episode.thumbnail,
                      fit: BoxFit.cover,
                      height: MediaQueryHelper.width(context, 0.225),
                      width: MediaQueryHelper.width(context, 0.4),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: MyTheme.tinyPadding,
                        decoration: const BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(MyTheme.defaultRadiusValue))
                        ),
                        child: Text(episode.number.toString(), style: MyTextStyle.ratingStyle,),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: MyTheme.defaultPadding.top,),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(episode.title ?? episode.id, style: MyTextStyle.titleBoldStyle, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  Text("episode ${episode.number}"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
