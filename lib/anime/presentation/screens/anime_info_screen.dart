import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/presentation/cubits/anime_info_cubit/anime_info_cubit.dart';
import 'package:fluttaku/anime/presentation/widgets/anime_info_details_widget.dart';
import 'package:fluttaku/anime/presentation/widgets/cover_widget.dart';
import 'package:fluttaku/anime/presentation/widgets/custom_flexible_space_bar.dart';
import 'package:fluttaku/core/config/theme.dart';
import 'package:fluttaku/core/presentation/widgets/gradient_mask_shader.dart';
import 'package:fluttaku/core/utils/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AnimeInfoScreen extends StatefulWidget {
  const AnimeInfoScreen({Key? key}) : super(key: key);

  @override
  State<AnimeInfoScreen> createState() => _AnimeInfoScreenState();
}

class _AnimeInfoScreenState extends State<AnimeInfoScreen> {

  late final AnimeInfoCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<AnimeInfoCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            actions: [
              IconButton(
                onPressed: GoRouter.of(context).pop,
                icon: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    boxShadow: MyTheme.boxShadow,
                    color: MyColors.foregroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close)
                )
              )
            ],
            automaticallyImplyLeading: false,
            surfaceTintColor: Colors.transparent,
            expandedHeight: MediaQueryHelper.height(context, 0.4),
            flexibleSpace: CustomFlexibleSpaceBar(
              maxDisplayHeight: MediaQueryHelper.height(context, 0.3),
              title: Text(
                _cubit.animePreview.title.romaji,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              display: appBarDisplay(_cubit.animePreview),
              background: BackgroundGradientShaderMask(
                stops: const <double>[0, 0.4, 0.75],
                child: CachedNetworkImage(
                  imageUrl: _cubit.animePreview.bannerImage ?? _cubit.animePreview.coverImage,
                  fit: BoxFit.cover,
                )
              ),
            ),
          ),
          const SliverPadding(
            padding: MyTheme.smallPadding,
            sliver: SliverToBoxAdapter(
              child: AnimeInfoDetailsWidget(),
            ),
          )
        ],
      )
    );
  }

  Widget appBarDisplay(AnimePreviewEntity animePreview) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: MyTheme.defaultPadding,
          child: CoverWidget(
            imageUrl: _cubit.animePreview.coverImage,
            rating: _cubit.animePreview.rating,
            isAiring: _cubit.animePreview.isAiring
          ),
        ),
        Flexible(
          flex: 3,
          child: Padding(
            padding: MyTheme.defaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    _cubit.animePreview.title.romaji,
                    style: MyTextStyle.titleBoldStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Text(
                    _cubit.animePreview.status.name,
                    style: MyTextStyle.primaryBoldText,
                  )
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}