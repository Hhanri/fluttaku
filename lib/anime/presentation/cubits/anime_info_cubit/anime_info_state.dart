part of 'anime_info_cubit.dart';

@immutable
abstract class AnimeInfoState extends Equatable {
  final AnimePreviewEntity animePreview;

  const AnimeInfoState({required this.animePreview});

  @override
  List<Object?> get props => [animePreview];
}

class AnimeInfoInitial extends AnimeInfoState {

  const AnimeInfoInitial({required super.animePreview});

  @override
  List<Object?> get props => [animePreview];
}

class AnimeInfoLoaded extends AnimeInfoState {
  final AnimeInfoEntity animeInfo;
  const AnimeInfoLoaded({required super.animePreview, required this.animeInfo});

  @override
  List<Object?> get props => [animePreview, animeInfo];
}

class AnimeInfoError extends AnimeInfoState {
  final Failure failure;

  const AnimeInfoError({required super.animePreview, required this.failure});

  @override
  List<Object?> get props => [animePreview, failure];
}