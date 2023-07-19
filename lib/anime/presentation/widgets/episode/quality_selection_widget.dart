import 'package:fluttaku/anime/domain/entities/anime_episode_streaming_source_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<String?> showIosQualityModal({
  required BuildContext context,
  required List<AnimeEpisodeStreamingSourceEntity> links,
  required String url
}) async {
  return showCupertinoModalPopup<String>(
    context: context,
    semanticsDismissible: true,
    builder: (context) {
      return QualitySelectionWidget(links: links, url: url,);
    },
  );
}

Future<String?> showAndroidQualityModel({
  required BuildContext context,
  required List<AnimeEpisodeStreamingSourceEntity> links,
  required String url
}) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return QualitySelectionWidget(links: links, url: url,);
    },
  );
}

class QualitySelectionWidget extends StatelessWidget {
  final List<AnimeEpisodeStreamingSourceEntity> links;
  final String url;
  const QualitySelectionWidget({Key? key, required this.links, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      shrinkWrap: true,
      itemCount: links.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => GoRouter.of(context).pop(links[index].url),
          child: ListTile(
            title: Text(links[index].quality),
            trailing: url == links[index].url ? const Icon(Icons.check) : null,
          ),
        );
      },
    );
  }
}
