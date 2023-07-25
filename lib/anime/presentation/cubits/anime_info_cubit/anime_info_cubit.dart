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
  AnimeInfoCubit({required this.animePreview, required this.useCase}) : super(
    AnimeInfoLoading(
      animePreview: animePreview,
      navBarState: AnimeInfoNavBarState.details
    )
  );

  AnimeInfoNavBarState navBarState = AnimeInfoNavBarState.details;

  Future<void> init() async {
    final res = await useCase.call(animePreview.id);
    res.fold(
      (error) => emit(AnimeInfoError(animePreview: animePreview, failure: error, navBarState: navBarState)),
      (success) => emit(AnimeInfoLoaded(animePreview: animePreview, animeInfo: success, navBarState: navBarState))
    );
  }

  void changeNavBarState({required AnimeInfoNavBarState newState}) {
    navBarState = newState;
    emit(state.changeNavBarState(navBarState: navBarState));
  }
}

enum AnimeInfoNavBarState {
  details,
  watch
}