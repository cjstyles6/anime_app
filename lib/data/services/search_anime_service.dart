import 'dart:convert';

import 'package:anime_app/features/search/model/search_anime/search_anime.dart';
import 'package:http/http.dart' as http;

class SearchAnimeService {
  final String baseUrl = 'https://api.jikan.moe/v4/anime';

  Future<SearchAnimeModel> fetchAnime(
      String query, String? type, String? status, String? orderBy) async {
    final url = Uri.parse(
      '$baseUrl?q=$query'
      '${type != null ? '&type=$type' : ''}'
      '${status != null ? '&status=$status' : ''}'
      '${orderBy != null ? '&order_by=$orderBy' : ''}',
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return SearchAnimeModel.fromJson(json);
      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
