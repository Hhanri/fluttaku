import 'package:dartz/dartz.dart';
import 'package:fluttaku/core/error/failure.dart';
import 'package:fluttaku/episode/domain/entities/episode_links_entity.dart';

abstract class EpisodeAPIRepositoryInterface {

  Future<Either<Failure,EpisodeLinksEntity>> fetchEpisodeLinks({required String episodeId});

}