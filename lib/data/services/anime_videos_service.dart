import 'package:anime_app/features/videos/models/anime_videos_model/anime_videos_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnimeVideosService {
  final String baseUrl = 'https://api.jikan.moe/v4/anime/';

  Future<AnimeVideosModel> fetchAnimeVideos(int id) async {
    final url = Uri.parse('$baseUrl$id/videos');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return AnimeVideosModel.fromJson(json);
      } else {
        throw Exception('Failed to load anime videos');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
