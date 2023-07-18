import 'dart:convert';

import 'package:fluttaku/anime/data/models/anime_episode_links_model.dart';
import 'package:fluttaku/anime/data/models/anime_info_model.dart';
import 'package:fluttaku/anime/data/models/anime_search_result_model.dart';
import 'package:fluttaku/anime/data/data_source/anime_data_source_interface.dart';
import 'package:fluttaku/anime/domain/entities/anime_episode_links_entity.dart';
import 'package:fluttaku/anime/domain/entities/anime_info_entity.dart';
import 'package:fluttaku/core/constants/default_page_size.dart';
import 'package:fluttaku/core/error/failure.dart';
import 'package:http/http.dart' as http;

class AnimeRemoteDataSource implements AnimeDataSourceInterface {

  final http.Client _client = http.Client();
  final String apiBaseUrl = 'https://api.consumet.org/meta/anilist/';
  final String _infoEndPoint = "info/";
  final String _watchEndPoint = "watch/";
  final String _popularEndPoint = "popular";
  final String _trendingEndPoint = "trending";
  final String _pageParam = "page=";
  final String _pageSizeParam = "perPage=";

  String pageParams({required int page, required int pageSize}) {
    return "?$_pageParam$page&$_pageSizeParam$pageSize";
  }

  @override
  Future<AnimeSearchResultModel> genericSearch({required String uri}) async {
    final response = await _client.get(Uri.parse(uri));
    
    final Map<String, dynamic> body = await jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw Failure(code: response.statusCode, message: body.toString());
    }

    final searchResult = AnimeSearchResultModel.fromJson(body);
    return searchResult;
  }

  @override
  Future<AnimeSearchResultModel> searchAnime({required String query, required int page, int pageSize = defaultPageSize}) async {
    final uri = "$apiBaseUrl$query${pageParams(page: page, pageSize: pageSize)}";
    return await genericSearch(uri: uri);
  }

  @override
  Future<AnimeSearchResultModel> fetchPopularAnimes({required int page, int pageSize = defaultPageSize}) async {
    final uri = "$apiBaseUrl$_popularEndPoint${pageParams(page: page, pageSize: pageSize)}";
    return await genericSearch(uri: uri);
  }

  @override
  Future<AnimeSearchResultModel> fetchTrendingAnimes({required int page, int pageSize = defaultPageSize}) async {
    final uri = "$apiBaseUrl$_trendingEndPoint${pageParams(page: page, pageSize: pageSize)}";
    return await genericSearch(uri: uri);
  }

  @override
  Future<AnimeInfoEntity> fetchAnimeInfo({required String animeId}) async {
    final uri = "$apiBaseUrl$_infoEndPoint$animeId";
    final response = await _client.get(Uri.parse(uri));

    final Map<String, dynamic> body = await jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw Failure(message: body.toString(), code: response.statusCode);
    }

    final searchResult = AnimeInfoModel.fromJson(body);
    return searchResult;
  }

  @override
  Future<AnimeEpisodeLinksEntity> fetchEpisodeLinks({required String episodeId}) async {
    final url = "$apiBaseUrl$_watchEndPoint$episodeId";
    final uri = Uri.parse(url);

    final response = await _client.get(uri);

    final Map<String, dynamic> body = await jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw Failure(message: body.toString(), code: response.statusCode);
    }

    final AnimeEpisodeLinksEntity episodeLinks = AnimeEpisodeLinksModel.fromJson(body);
    return episodeLinks;
  }
}