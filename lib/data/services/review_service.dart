import 'dart:convert';

import 'package:anime_app/features/details/model/review_model/review_model.dart';
import 'package:http/http.dart' as http;

class ReviewService {
  final String baseUrl = 'https://api.jikan.moe/v4/anime/';

  fetchReviews(int animeId) async {
    final url = Uri.parse('$baseUrl$animeId/reviews');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return ReviewModel.fromJson(json);
      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
