import 'dart:convert';

import 'package:anime_app/features/details/model/full_anime/full_anime.dart';
import 'package:http/http.dart' as http;

class AnimeFullIdService {
  final String baseUrl = 'https://api.jikan.moe/v4/anime/';

  Future<FullAnimeModel> fetchAnimeFullId(int animeId) async {
    final url = Uri.parse('$baseUrl$animeId/full');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return FullAnimeModel.fromJson(json);
      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
