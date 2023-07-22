import 'package:fluttaku/episode/domain/entities/episode_links_entity.dart';

abstract class EpisodeDataSourceInterface {

  Future<EpisodeLinksEntity> fetchEpisodeLinks({required String episodeId});

}