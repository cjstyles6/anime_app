import 'dart:convert';

import 'package:anime_app/features/home/models/top_anime/top_anime_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class TopAnimeService {
  final String baseUrl = 'https://api.jikan.moe/v4/top/anime?type=tv';

  Future<TopAnimeModel> fetchTopAnime() async {
    final url = Uri.parse(baseUrl);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return TopAnimeModel.fromJson(json);
      } else {
        throw Exception('Failed to load top anime ${response.statusCode}');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed to load top anime');
    }
  }
}
