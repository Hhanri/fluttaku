import 'package:fluttaku/anime/domain/entities/anime_preview_entity.dart';
import 'package:fluttaku/anime/presentation/pages/anime_info_page.dart';
import 'package:fluttaku/episode/presentation/pages/episode_page.dart';
import 'package:fluttaku/anime/presentation/screens/home_screen.dart';
import 'package:fluttaku/anime/presentation/screens/search_anime_screen.dart';
import 'package:fluttaku/episode/domain/entities/episode_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyGoRouter {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  static void pop() {
    GoRouter.of(context).pop();
  }

  static void maybePop() {
    if (GoRouter.of(context).canPop()) pop();
  }

  final router = GoRouter(
    initialLocation: homeRoute,
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        path: homeRoute,
        name: homeRouteName,
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomeScreen());
        }
      ),

      GoRoute(
        path: searchRoute,
        name: searchRouteName,
        pageBuilder: (context, state) {
          return MaterialPage(child: SearchAnimeScreen());
        }
      ),

      GoRoute(
        path: animeRoute,
        name: animeRouteName,
        pageBuilder: (context, state) {
          return MaterialPage(child: AnimeInfoPage(animePreview: state.extra as AnimePreviewEntity));
        },
      ),

      GoRoute(
        path: episodeRoute,
        name: episodeRouteName,
        pageBuilder: (context, state) {
          return MaterialPage(child: EpisodePage(episodeInfo: state.extra as EpisodeInfoEntity));
        }
      )
    ]
  );

  static const String homeRoute = "/home";
  static const String homeRouteName = "home";

  static const String searchRoute = "/search";
  static const String searchRouteName = "search";

  static const String animeRoute = "/anime";
  static const String animeRouteName = "anime";

  static const String episodeRoute = "/episode";
  static const String episodeRouteName = "episode";

}