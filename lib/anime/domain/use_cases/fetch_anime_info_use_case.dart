import 'package:dartz/dartz.dart';
import 'package:fluttaku/anime/domain/entities/anime_info_entity.dart';
import 'package:fluttaku/anime/domain/repository/anime_api_repository_interface.dart';
import 'package:fluttaku/core/error/failure.dart';
import 'package:fluttaku/core/use_cases/use_case.dart';

class FetchAnimeInfoUseCase extends UseCase<AnimeInfoEntity, String> {

  final AnimeAPIRepositoryInterface apiRepo;

  FetchAnimeInfoUseCase(this.apiRepo);

  @override
  Future<Either<Failure, AnimeInfoEntity>> call(String params) {
    return apiRepo.fetchAnimeInfo(animeId: params);
  }
}