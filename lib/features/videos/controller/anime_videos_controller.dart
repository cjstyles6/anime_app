import 'package:anime_app/data/services/anime_videos_service.dart';
import 'package:anime_app/features/videos/models/anime_videos_model/anime_videos_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeVideosController extends GetxController {
  AnimeVideosService animeVideosService = AnimeVideosService();
  Rx<AnimeVideosModel?> animeVideo = Rx<AnimeVideosModel?>(null);

  Future<void> getAnimeVideo(int animeId) async {
    try {
      final response = await animeVideosService.fetchAnimeVideos(animeId);
      animeVideo.value = response;
      if (animeVideo.value?.data?.promo?.isNotEmpty == true) {
        debugPrint(animeVideo.value?.data?.promo?.first.trailer?.youtubeId);
      }
      debugPrint(animeVideo.value?.data.toString());
    } catch (e) {
      debugPrint('Error in getAnimeVideo $e');
      rethrow;
    }
  }
}
