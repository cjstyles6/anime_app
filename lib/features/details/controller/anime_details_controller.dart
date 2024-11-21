import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../utils/arguments/arguments.dart';
import 'full_anime_controller.dart';

class AnimeDetailsController extends GetxController {
  final FullAnimeController fullAnimeController = Get.find();

  final RxBool isCollapsed = false.obs;
  final RxBool isTextExpanded = false.obs;
  final RxBool isLoading = true.obs;
  final RxBool isFavorite = false.obs;

  final RxBool isCharactersLoading = true.obs;
  final RxBool isStaffLoading = true.obs;
  final RxBool isRelatedAnimeLoading = true.obs;
  final RxBool isReviewsLoading = true.obs;

  Future<void> loadAnimeDetails() async {
    try {
      isLoading.value = true;
      isCharactersLoading.value = true;
      isStaffLoading.value = true;
      isRelatedAnimeLoading.value = true;
      isReviewsLoading.value = true;

      // fullAnimeController.clearData();

      final arguments = Get.arguments as AnimeDetailsArguments;
      final animeId = int.parse(arguments.animeId);

      await fullAnimeController.getFullAnime(animeId);
      isLoading.value = false;

      await Future.wait([
        _loadCharacters(animeId),
        _loadStaff(animeId),
        _loadRelatedAnime(animeId),
        _loadReviews(animeId),
      ], eagerError: false);
    } catch (e) {
      debugPrint('Error loading anime details: $e');
    }
  }

  Future<void> _loadCharacters(int animeId) async {
    try {
      if (fullAnimeController.characters.value?.data != null) {
        // Clear existing character data before loading new ones
        fullAnimeController.characters.value = null;
      }
      await fullAnimeController.getCharacters(animeId);
    } catch (e) {
      debugPrint('Error loading characters: $e');
    } finally {
      isCharactersLoading.value = false;
    }
  }

  Future<void> _loadStaff(int animeId) async {
    try {
      if (fullAnimeController.animeStaffs.value?.data != null) {
        // Clear existing staff data before loading new ones
        fullAnimeController.animeStaffs.value = null;
      }
      await fullAnimeController.getStaff(animeId);
    } catch (e) {
      debugPrint('Error loading staff: $e');
    } finally {
      isStaffLoading.value = false;
    }
  }

  Future<void> _loadRelatedAnime(int animeId) async {
    try {
      if (fullAnimeController.relatedAnime.value?.data != null) {
        // Clear existing related anime data before loading new ones
        fullAnimeController.relatedAnime.value = null;
      }
      await fullAnimeController.getRelatedAnime(animeId);
    } catch (e) {
      debugPrint('Error loading related anime: $e');
    } finally {
      isRelatedAnimeLoading.value = false;
    }
  }

  Future<void> _loadReviews(int animeId) async {
    try {
      if (fullAnimeController.reviews.value?.data != null) {
        // Clear existing review data before loading new ones
        fullAnimeController.reviews.value = null;
      }
      await fullAnimeController.getReviews(animeId);
    } catch (e) {
      debugPrint('Error loading reviews: $e');
    } finally {
      isReviewsLoading.value = false;
    }
  }

  @override
  void onClose() {
    fullAnimeController.clearData();
    super.onClose();
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void toggleTextExpanded() {
    isTextExpanded.value = !isTextExpanded.value;
  }
}
