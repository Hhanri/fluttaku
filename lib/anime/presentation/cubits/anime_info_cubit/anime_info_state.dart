part of 'anime_info_cubit.dart';

@immutable
abstract class AnimeInfoState extends Equatable {
  final AnimePreviewEntity animePreview;
  final AnimeInfoNavBarState navBarState;
  const AnimeInfoState({required this.animePreview, required this.navBarState});

  @override
  List<Object?> get props => [animePreview, navBarState];

  AnimeInfoState changeNavBarState({required AnimeInfoNavBarState navBarState});
}

class AnimeInfoLoading extends AnimeInfoState {

  const AnimeInfoLoading({required super.animePreview, required super.navBarState});

  @override
  List<Object?> get props => [animePreview, navBarState];

  @override
  AnimeInfoState changeNavBarState({required AnimeInfoNavBarState navBarState}) {
    return AnimeInfoLoading(animePreview: animePreview, navBarState: navBarState);
  }
}

class AnimeInfoLoaded extends AnimeInfoState {
  final AnimeInfoEntity animeInfo;
  const AnimeInfoLoaded({required super.animePreview, required this.animeInfo, required super.navBarState});

  @override
  List<Object?> get props => [animePreview, animeInfo, navBarState];

  @override
  AnimeInfoState changeNavBarState({required AnimeInfoNavBarState navBarState}) {
    return AnimeInfoLoaded(
      animePreview: animePreview,
      animeInfo: animeInfo,
      navBarState: navBarState
    );
  }
}

class AnimeInfoError extends AnimeInfoState {
  final Failure failure;

  const AnimeInfoError({required super.animePreview, required this.failure, required super.navBarState});

  @override
  List<Object?> get props => [animePreview, failure, navBarState];

  @override
  AnimeInfoState changeNavBarState({required AnimeInfoNavBarState navBarState}) {
    return AnimeInfoError(
      animePreview: animePreview,
      failure: failure,
      navBarState: navBarState
    );
  }
}