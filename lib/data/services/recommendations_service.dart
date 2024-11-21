import 'dart:convert';
import 'package:anime_app/features/search/model/recommendations_model/recommendations_model.dart';
import 'package:http/http.dart' as http;

class RecommendationsService {
  final String baseUrl = 'https://api.jikan.moe/v4/recommendations/anime';

  fetchRecommendations() async {
    final url = Uri.parse(baseUrl);

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return RecommendationsModel.fromJson(json);
      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
