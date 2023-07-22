import 'package:dartz/dartz.dart';
import 'package:fluttaku/episode/domain/entities/episode_links_entity.dart';
import 'package:fluttaku/core/error/failure.dart';
import 'package:fluttaku/core/use_cases/use_case.dart';
import 'package:fluttaku/episode/domain/repository/episode_api_repository_interface.dart';

class FetchEpisodeLinksUseCase extends UseCase<EpisodeLinksEntity, String> {

  final EpisodeAPIRepositoryInterface apiRepo;

  FetchEpisodeLinksUseCase(this.apiRepo);

  @override
  Future<Either<Failure, EpisodeLinksEntity>> call(String params) {
    return apiRepo.fetchEpisodeLinks(episodeId: params);
  }
}