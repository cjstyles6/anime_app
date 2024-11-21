import 'dart:convert';

import 'package:anime_app/features/details/model/related_anime_model/related_anime_model.dart';
import 'package:http/http.dart' as http;

class RelatedAnimeService {
  final String baseUrl = 'https://api.jikan.moe/v4/anime/';

  fetchRelatedAnimes(int animeId) async {
    final url = Uri.parse('$baseUrl$animeId/recommendations');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return RelatedAnimeModel.fromJson(json);
      } else {
        throw Exception('something went wrong');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
