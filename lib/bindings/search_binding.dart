import 'package:anime_app/features/search/controller/anime_search_controller.dart';
import 'package:get/get.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeSearchController>(() => AnimeSearchController());
    // Get.lazyPut<NavigationController>(() => NavigationController());
  }
}
