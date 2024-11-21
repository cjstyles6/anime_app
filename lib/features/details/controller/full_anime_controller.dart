import 'package:anime_app/data/services/anime_full_id_service.dart';
import 'package:anime_app/data/services/anime_staff_service.dart';
import 'package:anime_app/data/services/characters_service.dart';
import 'package:anime_app/data/services/related_anime_service.dart';
import 'package:anime_app/data/services/review_service.dart';
import 'package:anime_app/features/details/model/characters_model/characters_model.dart';
import 'package:anime_app/features/details/model/full_anime/full_anime.dart';
import 'package:anime_app/features/details/model/related_anime_model/related_anime_model.dart';
import 'package:anime_app/features/details/model/review_model/review_model.dart';
import 'package:anime_app/features/details/model/staff_models/staff_models.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FullAnimeController extends GetxController {
  final AnimeFullIdService animeFullIdService = AnimeFullIdService();
  Rx<FullAnimeModel?> fullAnime = Rx<FullAnimeModel?>(null);

  final CharactersService characterService = CharactersService();
  Rx<CharactersModel?> characters = Rx<CharactersModel?>(null);

  final AnimeStaffService animeStaffService = AnimeStaffService();
  Rx<StaffModels?> animeStaffs = Rx<StaffModels?>(null);

  final RelatedAnimeService relatedAnimeService = RelatedAnimeService();
  Rx<RelatedAnimeModel?> relatedAnime = Rx<RelatedAnimeModel?>(null);

  final ReviewService reviewService = ReviewService();
  Rx<ReviewModel?> reviews = Rx<ReviewModel?>(null);

  void clearData() {
    fullAnime.value = null;
    characters.value = null;
    animeStaffs.value = null;
    relatedAnime.value = null;
    reviews.value = null;
  }

  Future<void> getFullAnime(int animeId) async {
    try {
      final response = await animeFullIdService.fetchAnimeFullId(animeId);
      fullAnime.value = response;
    } catch (e) {
      debugPrint('Error in getFullAnime: $e');
      rethrow;
    }
  }

  Future<void> getCharacters(int animeId) async {
    try {
      final response = await characterService.fetchCharacters(animeId);
      characters.value = response;
    } catch (e) {
      debugPrint('Error in getCharacters: $e');
      rethrow;
    }
  }

  Future<void> getStaff(int animeId) async {
    try {
      final response = await animeStaffService.fetchAnimeStaffService(animeId);
      animeStaffs.value = response;
    } catch (e) {
      debugPrint('Error in getStaffs: $e');
      rethrow;
    }
  }

  Future<void> getRelatedAnime(int animeId) async {
    try {
      final response = await relatedAnimeService.fetchRelatedAnimes(animeId);
      relatedAnime.value = response;
    } catch (e) {
      debugPrint('Error in getRelatedAnime: $e');
      rethrow;
    }
  }

  Future<void> getReviews(int animeId) async {
    try {
      final response = await reviewService.fetchReviews(animeId);
      reviews.value = response;
    } catch (e) {
      debugPrint('Error in getReviews: $e');
      rethrow;
    }
  }
}
