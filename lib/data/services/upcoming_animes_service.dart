import 'dart:convert';

import 'package:anime_app/features/upcoming/model/upcoming_anime_model/upcoming_anime_model.dart';
import 'package:http/http.dart' as http;

class UpcomingAnimesService {
  Future<UpcomingAnimeModel> fetchUpcomingAnimes() async {
    final url = Uri.parse('https://api.jikan.moe/v4/seasons/upcoming');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return UpcomingAnimeModel.fromJson(json);
      } else {
        throw Exception(
            'Failed to load upcoming animes. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch upcoming animes: ${e.toString()}');
    }
  }
}
