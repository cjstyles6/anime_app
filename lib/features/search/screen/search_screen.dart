import 'package:anime_app/common/screen/search_error_screen.dart';
import 'package:anime_app/features/search/controller/anime_search_controller.dart';
import 'package:anime_app/features/search/screen/widgets/anime_results.dart';
import 'package:anime_app/features/search/screen/widgets/anime_search_bar.dart';
import 'package:anime_app/features/search/screen/widgets/recommended_animes.dart';
import 'package:anime_app/utils/sizes.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AnimeSearchController controller = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AnimeSearchBar(),
              20.heightBox,
              Expanded(
                child: Obx(
                  () {
                    if (controller.isLoading.value) {
                      return Center(
                        child: LoadingBumpingLine.circle(
                          backgroundColor: Colors.white,
                          size: 50,
                        ),
                      );
                    }
                    if (controller.textController.text.isNotEmpty &&
                        controller.searchAnime.value != null) {
                      final searchResults =
                          controller.searchAnime.value?.data ?? [];
                      if (searchResults.isEmpty) {
                        return const SearchErrorScreen();
                      }
                      return const AnimeResults();
                    }
                    return const RecommendedAnimes();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
