import 'dart:convert';

import 'package:fluttaku/episode/data/data_source/episode_data_source_interface.dart';
import 'package:fluttaku/episode/data/models/episode_links_model.dart';
import 'package:fluttaku/episode/domain/entities/episode_links_entity.dart';
import 'package:fluttaku/core/error/failure.dart';
import 'package:http/http.dart' as http;

class EpisodeRemoteDataSource implements EpisodeDataSourceInterface {

  final http.Client _client = http.Client();
  final String apiBaseUrl = 'https://api.consumet.org/meta/anilist/';
  final String _watchEndPoint = "watch/";

  @override
  Future<EpisodeLinksEntity> fetchEpisodeLinks({required String episodeId}) async {
    final url = "$apiBaseUrl$_watchEndPoint$episodeId";
    final uri = Uri.parse(url);

    final response = await _client.get(uri);

    final Map<String, dynamic> body = await jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw Failure(message: body.toString(), code: response.statusCode);
    }

    final EpisodeLinksEntity episodeLinks = EpisodeLinksModel.fromJson(body);
    return episodeLinks;
  }
}