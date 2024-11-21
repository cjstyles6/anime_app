import 'package:anime_app/routes/app_routes.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
    update();
  }

  final screen = [
    AppRoutes.HOME,
    AppRoutes.RELEASE_CALENDAR,
    AppRoutes.MY_LIST,
    AppRoutes.PROFILE,
  ];
}
