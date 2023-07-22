import 'package:dartz/dartz.dart';
import 'package:fluttaku/episode/data/data_source/episode_data_source_interface.dart';
import 'package:fluttaku/episode/domain/entities/episode_links_entity.dart';
import 'package:fluttaku/core/error/failure.dart';
import 'package:fluttaku/episode/domain/repository/episode_api_repository_interface.dart';

class EpisodeApiRepositoryImpl implements EpisodeAPIRepositoryInterface {

  final EpisodeDataSourceInterface dataSource;

  EpisodeApiRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, EpisodeLinksEntity>> fetchEpisodeLinks({required String episodeId}) {
    return _fetch(() => dataSource.fetchEpisodeLinks(episodeId: episodeId)) ;
  }

  Future<Either<Failure, T>> _fetch<T>(
    Future<T> Function() function
  ) async {
    try {
      final res = await function();
      return Right(res);
    } on Failure catch(e) {
      return Left(e);
    } catch(e) {
      return Left(Failure(message: e.toString()));
    }
  }

}