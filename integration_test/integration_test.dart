// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:chewie/chewie.dart';
import 'package:fluttaku/anime/presentation/pages/anime_info_page.dart';
import 'package:fluttaku/anime/presentation/screens/home_screen.dart';
import 'package:fluttaku/anime/presentation/screens/search_anime_screen.dart';
import 'package:fluttaku/anime/presentation/widgets/anime_info/anime_info_details_widget.dart';
import 'package:fluttaku/anime/presentation/widgets/anime_info/anime_info_episodes_widget.dart';
import 'package:fluttaku/anime/presentation/widgets/anime_info/custom_flexible_space_bar.dart';
import 'package:fluttaku/anime/presentation/widgets/cover_title_widget.dart';
import 'package:fluttaku/anime/presentation/widgets/home/popular_animes_widget.dart';
import 'package:fluttaku/anime/presentation/widgets/home/trending_animes_widget.dart';
import 'package:fluttaku/anime/presentation/widgets/text_fields/home_search_button.dart';
import 'package:fluttaku/anime/presentation/widgets/text_fields/search_anime_text_field.dart';
import 'package:fluttaku/core/config/router.dart';
import 'package:fluttaku/core/presentation/widgets/anime_info_nav_bar.dart';
import 'package:fluttaku/core/service_locator.dart';
import 'package:fluttaku/episode/presentation/widgets/episode_tile_widget.dart';
import 'package:fluttaku/episode/presentation/widgets/quality_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttaku/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final homeScreen = find.byType(HomeScreen);
  final trendingAnimesListView = find.byType(TrendingAnimesWidget);
  final popularAnimesListView = find.byType(PopularAnimesWidget);
  final homeSearchButton = find.byType(HomeSearchButton);
  final searchScreen = find.byType(SearchAnimeScreen);
  final textField = find.byType(SearchAnimeTextField);
  final searchButton = find.byIcon(Icons.search);
  final animeCoverWidget = find.byType(CoverTitleWidget);
  final navBar = find.byType(AnimeInfoNavBar);
  final animeInfoPage = find.byType(AnimeInfoPage);
  final animeDetails = find.byType(AnimeInfoDetailsWidget);
  final animeInfoAppBar = find.byType(CustomFlexibleSpaceBar);
  final watchIcon = find.byIcon(Icons.tv);
  final episodesListView = find.byType(AnimeInfoEpisodesWidget);
  final episodeTile = find.byType(EpisodeTileWidget);
  final videoPlayer = find.byType(Chewie);
  final moreIcon = find.byIcon(Icons.more_vert);
  final qualityTile = find.text('Quality');
  final qualitySelector = find.byType(QualitySelectionWidget);
  final quality720 = find.text('720p');

  testWidgets('search anime test', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(homeScreen, findsOneWidget);
    expect(trendingAnimesListView, findsOneWidget);
    expect(popularAnimesListView, findsOneWidget);
    expect(homeSearchButton, findsOneWidget);

    await tester.tap(homeSearchButton);
    await tester.pumpAndSettle();
    expect(searchScreen, findsOneWidget);
    expect(homeScreen, findsNothing);
    expect(textField, findsOneWidget);
    expect(searchButton, findsOneWidget);

    await tester.enterText(textField, 'Kimetsu no Yaiba');
    await tester.pumpAndSettle();
    await tester.tap(searchButton);
    await tester.pumpAndSettle();
    expect(animeCoverWidget, findsWidgets);

    await tester.tap(animeCoverWidget.first);
    await tester.pumpAndSettle();
    expect(animeInfoPage, findsOneWidget);
    expect(searchScreen, findsNothing);
    expect(navBar, findsOneWidget);
    expect(animeDetails, findsOneWidget);
    expect(animeInfoAppBar, findsOneWidget);
    expect(episodesListView, findsNothing);

    await tester.tap(watchIcon);
    await tester.pumpAndSettle();
    expect(animeDetails, findsNothing);
    expect(episodesListView, findsOneWidget);

    await tester.tap(episodeTile.first);
    await tester.pumpAndSettle();
    expect(animeInfoPage, findsNothing);
    expect(videoPlayer, findsOneWidget);
    expect(moreIcon, findsOneWidget);

    await tester.tapAt(Offset.zero);
    await tester.pump();
    await tester.tap(moreIcon);
    await tester.pumpAndSettle();
    expect(qualityTile, findsOneWidget);

    await tester.tap(qualityTile);
    await tester.pumpAndSettle();
    expect(qualityTile, findsNothing);
    expect(qualitySelector, findsOneWidget);

    await tester.tap(quality720);
    await tester.pumpAndSettle();
    expect(qualitySelector, findsNothing);

    final navigator = sl.get<MyGoRouter>();

    navigator.router.pop();
    await tester.pumpAndSettle();
    expect(videoPlayer, findsNothing);
    expect(animeInfoPage, findsOneWidget);

    navigator.router.pop();
    await tester.pumpAndSettle();
    expect(animeInfoPage, findsNothing);
    expect(searchScreen, findsOneWidget);

    navigator.router.pop();
    await tester.pumpAndSettle();
    expect(searchScreen, findsNothing);
    expect(homeScreen, findsOneWidget);
  });
}
