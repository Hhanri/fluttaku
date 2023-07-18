import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/presentation/cubits/anime_info_cubit/anime_info_cubit.dart';
import 'package:fluttaku/anime/presentation/screens/anime_info_screen.dart';
import 'package:fluttaku/core/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeInfoPage extends StatelessWidget {
  final AnimePreviewEntity animePreview;
  const AnimeInfoPage({Key? key, required this.animePreview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnimeInfoCubit>(
      create: (_) => sl.get<AnimeInfoCubit>(param1: animePreview)..init(),
      child: const AnimeInfoScreen()
    );
  }
}
