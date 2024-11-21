import 'dart:convert';

import 'package:anime_app/features/details/model/staff_models/staff_models.dart';
import 'package:http/http.dart' as http;

class AnimeStaffService {
  final String baseUrl = 'https://api.jikan.moe/v4/anime/';

  fetchAnimeStaffService(int animeId) async {
    final url = Uri.parse('$baseUrl$animeId/staff');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return StaffModels.fromJson(json);
      } else {
        throw Exception('something went wrong');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
