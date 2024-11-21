import 'package:anime_app/features/details/controller/full_anime_controller.dart';
import 'package:anime_app/features/home/controller/home_controller.dart';
import 'package:get/get.dart';

import '../features/home/controller/navigation_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<FullAnimeController>(() => FullAnimeController());
  }
}
