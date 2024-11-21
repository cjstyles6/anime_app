import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../common/screen/error_screen.dart';
import '../controller/home_controller.dart';
import 'widgets/home_appbar.dart';
import 'widgets/new_episode_release.dart';
import 'widgets/top_anime_hits_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: Colors.black,
      onRefresh: () => controller.loadAnimeData(),
      child: Scaffold(
        body: Obx(
          () {
            if (controller.error.isNotEmpty) {
              return const ErrorScreen();
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Skeletonizer(
                    enabled: controller.isLoading.value,
                    child: const HomeAppbar(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        TopAnimeHitsWidget(),
                        SizedBox(height: 20),
                        NewEpisodeRelease(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
