import 'package:anime_app/features/videos/controller/anime_videos_controller.dart';
import 'package:get/get.dart';

class VideosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeVideosController>(() => AnimeVideosController());
  }
}
