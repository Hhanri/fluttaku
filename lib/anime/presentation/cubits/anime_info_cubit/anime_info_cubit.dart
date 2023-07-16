import 'package:equatable/equatable.dart';
import 'package:fluttaku/anime/domain/entities/anime_info_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/domain/use_cases/fetch_anime_info_use_case.dart';
import 'package:fluttaku/core/error/failure.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'anime_info_state.dart';

class AnimeInfoCubit extends Cubit<AnimeInfoState> {
  final AnimePreviewEntity animePreview;
  final FetchAnimeInfoUseCase useCase;
  AnimeInfoCubit({required this.animePreview, required this.useCase}) : super(AnimeInfoInitial(animePreview: animePreview));

  void init() async {
    final res = await useCase.call(animePreview.id);
    res.fold(
      (error) => emit(AnimeInfoError(animePreview: animePreview, failure: error)),
      (success) => emit(AnimeInfoLoaded(animePreview: animePreview, animeInfo: success))
    );
  }
}
