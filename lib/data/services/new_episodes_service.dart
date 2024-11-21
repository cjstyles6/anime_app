import 'dart:convert';

import 'package:anime_app/features/home/models/new_episode/new_episode_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class NewEpisodesService {
  final String baseUrl = 'https://api.jikan.moe/v4/watch/episodes';

  Future<NewEpisodeModel> fetchNewEpisode() async {
    final url = Uri.parse(baseUrl);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return NewEpisodeModel.fromJson(json);
      } else {
        throw Exception('Failed to load new episodes ${response.statusCode}');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw 'Failed to load new episodes';
    }
  }
}
