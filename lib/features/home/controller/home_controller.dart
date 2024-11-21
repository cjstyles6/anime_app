import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/new_episodes_service.dart';
import '../../../data/services/top_anime_service.dart';
import '../models/new_episode/new_episode_model.dart';
import '../models/top_anime/top_anime_model.dart';

class HomeController extends GetxController {
  final TopAnimeService topAnimeService = TopAnimeService();
  final NewEpisodesService newEpisodesService = NewEpisodesService();
  final Rx<TopAnimeModel?> topanime = Rx<TopAnimeModel?>(null);
  final Rx<NewEpisodeModel?> newEpisode = Rx<NewEpisodeModel?>(null);
  var isLoading = true.obs; // Set initial loading to true
  var error = ''.obs;
  var myAnimeList = <TopAnimeModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadAnimeData();
  }

  final random = Random();

  Map<String, String>? getRandomAnime() {
    // Return null if data is not loaded yet
    if (topanime.value?.data?.isEmpty ?? true) {
      return null;
    }

    final randomIndex = random.nextInt(topanime.value!.data!.length);
    final randomAnime = topanime.value!.data![randomIndex];

    // Check if required fields are available
    if (randomAnime.images?.jpg?.largeImageUrl == null) {
      return null;
    }

    return {
      'image': randomAnime.images!.jpg!.largeImageUrl!,
      'title': randomAnime.title ?? 'No Title',
      'genres': randomAnime.genres?.map((genre) => genre.name).join(', ') ??
          'No Genres',
      'mal_id': randomAnime.malId?.toString() ?? '0',
      'synopsis': randomAnime.synopsis ?? 'No Synopsis',
      'year': randomAnime.aired?.prop?.from?.year?.toString() ?? 'N/A',
      'studio': randomAnime.studios?.isNotEmpty == true
          ? randomAnime.studios![0].name ?? 'No Studio'
          : 'No Studio',
      'season': randomAnime.season ?? 'No Season',
      'demographics': randomAnime.demographics?.isNotEmpty == true
          ? randomAnime.demographics![0].name ?? 'No Demographics'
          : 'No Demographics',
      'type': randomAnime.type ?? 'No Type',
      'score': randomAnime.score?.toString() ?? 'N/A',
    };
  }

  Future<void> loadAnimeData() async {
    isLoading.value = true;
    error.value = '';

    try {
      await Future.wait([
        getNewEpisodes(),
        getTopAnime(),
      ]);
    } catch (e) {
      error.value = 'Failed to load data. Please try again.';
      debugPrint('Error loading data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getTopAnime() async {
    try {
      final response = await topAnimeService.fetchTopAnime();
      topanime.value = response;
    } catch (e) {
      error.value = 'Error loading top anime: $e';
      debugPrint('Error in getTopAnime: $e');
      rethrow;
    }
  }

  Future<void> getNewEpisodes() async {
    try {
      final response = await newEpisodesService.fetchNewEpisode();
      newEpisode.value = response;
    } catch (e) {
      error.value = 'Error loading new episodes: $e';
      debugPrint('Error in getNewEpisodes: $e');
      rethrow;
    }
  }

  void addToMyList(TopAnimeModel anime) {
    myAnimeList.add(anime);
  }
}
