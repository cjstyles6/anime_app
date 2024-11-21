import 'dart:convert';

import 'package:anime_app/features/details/model/characters_model/characters_model.dart';
import 'package:http/http.dart' as http;

class CharactersService {
  final String baseUrl = 'https://api.jikan.moe/v4/anime/';

  fetchCharacters(int id) async {
    final url = Uri.parse('$baseUrl$id/characters');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return CharactersModel.fromJson(json);
      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
