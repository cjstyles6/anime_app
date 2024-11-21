import 'package:anime_app/features/upcoming/controller/upcoming_anime_controller.dart';
import 'package:get/get.dart';

class UpcomingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      UpcomingAnimeController(),
    ); // Get.lazyPut<NavigationController>(() => NavigationController());
  }
}
