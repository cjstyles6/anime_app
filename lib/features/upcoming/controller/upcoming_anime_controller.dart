import 'package:anime_app/data/services/upcoming_animes_service.dart';
import 'package:anime_app/features/upcoming/model/upcoming_anime_model/upcoming_anime_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class UpcomingAnimeController extends GetxController {
  final UpcomingAnimesService upcomingAnimesService = UpcomingAnimesService();
  Rx<UpcomingAnimeModel?> upcomingAnime = Rx<UpcomingAnimeModel?>(null);
  RxBool isLoading = true.obs;
  RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getUpcomingAnime();
  }

  Future<void> getUpcomingAnime() async {
    try {
      isLoading.value = true;
      error.value = '';
      final response = await upcomingAnimesService.fetchUpcomingAnimes();
      upcomingAnime.value = response;
    } catch (e) {
      error.value = e.toString();
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
