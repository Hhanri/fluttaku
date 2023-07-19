import 'package:dartz/dartz.dart';
import 'package:fluttaku/anime/domain/entities/anime_episode_links_entity.dart';
import 'package:fluttaku/anime/domain/repository/anime_api_repository_interface.dart';
import 'package:fluttaku/core/error/failure.dart';
import 'package:fluttaku/core/use_cases/use_case.dart';

class FetchEpisodeLinksUseCase extends UseCase<AnimeEpisodeLinksEntity, String> {

  final AnimeAPIRepositoryInterface apiRepo;

  FetchEpisodeLinksUseCase(this.apiRepo);

  @override
  Future<Either<Failure, AnimeEpisodeLinksEntity>> call(String params) {
    return apiRepo.fetchEpisodeLinks(episodeId: params);
  }
}