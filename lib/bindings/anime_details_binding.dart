import 'package:anime_app/features/details/controller/anime_details_controller.dart';
import 'package:anime_app/features/details/controller/full_anime_controller.dart';
import 'package:get/get.dart';

class AnimeDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeDetailsController>(() => AnimeDetailsController());
    Get.lazyPut<FullAnimeController>(() => FullAnimeController());
  }
}
