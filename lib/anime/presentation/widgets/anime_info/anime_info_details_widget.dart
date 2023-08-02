import 'package:fluttaku/anime/domain/entities/anime_info_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/presentation/cubits/anime_info_cubit/anime_info_cubit.dart';
import 'package:fluttaku/anime/presentation/widgets/cover_title_widget.dart';
import 'package:fluttaku/core/config/theme.dart';
import 'package:fluttaku/core/presentation/widgets/horizontal_list_view_layout.dart';
import 'package:fluttaku/core/presentation/widgets/separated_list_view.dart';
import 'package:fluttaku/core/utils/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AnimeInfoDetailsWidget extends StatelessWidget {
  const AnimeInfoDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeInfoCubit, AnimeInfoState>(
      builder: (context, state) {
        if (state is AnimeInfoError) {
          return Center(child: Text(state.failure.message),);
        } else if (state is AnimeInfoLoaded) {
          return Column(
            children: [
              Padding(
                padding: MyTheme.defaultPadding,
                child: details(animeInfo: state.animeInfo),
              ),

              Padding(
                padding: MyTheme.defaultPadding,
                child: Text(
                  Bidi.stripHtmlIfNeeded(state.animeInfo.description ?? "No description"),
                  textAlign: TextAlign.justify,
                ),
              ),

              recommendation(animes: state.animeInfo.recommendations, height: MediaQueryHelper.responsiveWidthHeight(context, 0.3))
              
            ],
          );
        }
        return  const Center(child:CircularProgressIndicator());

      }
    );
  }


  Widget details({required AnimeInfoEntity animeInfo}) {
    return Column(
      children: [
        row(label: "Mean Score", value: "${animeInfo.rating == null ? "??" : animeInfo.rating!/10} / 10"),
        row(label: "Status", value: animeInfo.status.name),
        row(label: "Total Episode", value: "${animeInfo.currentEpisode ?? "??"} | ${animeInfo.totalEpisodes ?? "??"}"),
        row(label: "Average duration", value: "${animeInfo.duration ?? "??"} min"),
        row(label: "Format", value: animeInfo.type),
        row(label: "Studio", value: animeInfo.studios.join(" - ")),
        row(label: "Season", value: "${animeInfo.season ?? "??"} ${animeInfo.releaseYear}"),
        row(label: "Start Date", value: animeInfo.startDate == null ? "??" : DateFormat.yMMMd().format(animeInfo.startDate!)),
        row(label: "End Date", value: animeInfo.endDate == null ? "??": DateFormat.yMMMd().format(animeInfo.endDate!)),
      ],
    );
  }

  Widget row({required String label, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        const Spacer(),
        Flexible(child: Text(value, style: MyTextStyle.titleBoldStyle,))
      ],
    );
  }
  
  Widget recommendation({required List<AnimePreviewEntity> animes, required double height}) {
    return HorizontalListViewLayout(
      title: "Recommendations",
      height: height,
      listView: MySeparatedListView(
        padding: MyTheme.defaultHorizontalPadding,
        scrollDirection: Axis.horizontal,
        itemCount: animes.length,
        itemBuilder: (context, index) {
          return CoverTitleWidget(animePreview: animes[index]);
        },
      )
    );
  }
}
