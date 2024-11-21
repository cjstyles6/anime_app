import 'package:anime_app/data/services/recommendations_service.dart';
import 'package:anime_app/data/services/search_anime_service.dart';
import 'package:anime_app/features/search/model/recommendations_model/recommendations_model.dart';
import 'package:anime_app/features/search/model/search_anime/search_anime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

class AnimeSearchController extends GetxController {
  TextEditingController textController = TextEditingController();

  RxString selectType = ''.obs;
  RxString selectStatus = ''.obs;
  RxString selectOrderBy = ''.obs;

  RecommendationsService recommendationsService = RecommendationsService();
  Rx<RecommendationsModel?> recommendation = Rx<RecommendationsModel?>(null);

  SearchAnimeService animeSearchService = SearchAnimeService();
  Rx<SearchAnimeModel?> searchAnime = Rx<SearchAnimeModel?>(null);

  RxBool isLoading = false.obs;

  final _debouncer = Debouncer(delay: const Duration(milliseconds: 500));

  void clearRecommendations() {
    recommendation.value = null;
  }

  getSearchAnime() async {
    if (textController.text.isEmpty) {
      searchAnime.value = null;
      return;
    }

    _debouncer.call(() async {
      try {
        isLoading.value = true;
        searchAnime.value = await animeSearchService.fetchAnime(
          textController.text,
          selectType.value,
          selectStatus.value,
          selectOrderBy.value,
        );
      } catch (e) {
        debugPrint('Error in getSearchAnime: $e');
      } finally {
        isLoading.value = false;
      }
    });
    update();
  }

  void toggleFilterValue(RxString filterValue, String newValue) {
    if (filterValue.value == newValue) {
      filterValue.value = '';
    } else {
      filterValue.value = newValue;
    }
    getSearchAnime();
  }

  getRecommendations() async {
    try {
      isLoading.value = true;
      recommendation.value =
          await recommendationsService.fetchRecommendations();
    } catch (e) {
      debugPrint('Error in getRecommendations: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getRecommendations();
    super.onInit();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
