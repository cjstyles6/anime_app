import 'package:anime_app/features/details/controller/full_anime_controller.dart';
import 'package:anime_app/features/home/controller/home_controller.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../routes/app_routes.dart';
import '../../../../utils/arguments/arguments.dart';
import '../../../../utils/constants/colors.dart';

class NewEpisodeRelease extends StatelessWidget {
  const NewEpisodeRelease({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    FullAnimeController fullAnimeController = Get.find();

    return Obx(() {
      final isLoading = controller.isLoading.value;
      final episodes = controller.newEpisode.value?.data;

      return Skeletonizer(
        enabled: isLoading,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('New Episode Release')
                    .fontSize(20.sp)
                    .textColor(Colors.white),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.NEW_EpiSODE),
                  child: const Text('See all')
                      .fontSize(18)
                      .textColor(primaryColor),
                )
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  // Show placeholder during loading
                  if (isLoading) {
                    return _buildPlaceholderItem();
                  }

                  final anime = episodes?[index];
                  if (anime?.entry == null) {
                    return const SizedBox.shrink();
                  }
                  return GestureDetector(
                    onTap: () {
                      final entry = anime!.entry!;
                      if (entry.malId != null) {
                        Get.toNamed(
                          AppRoutes.ANIME_DETAIL,
                          arguments: AnimeDetailsArguments(
                            animeId: entry.malId?.toString() ?? '',
                            title: entry.title ?? '',
                            imageUrl: entry.images?.jpg?.largeImageUrl ?? '',
                            demographics: fullAnimeController
                                    .fullAnime.value?.data?.demographics
                                    ?.map((e) => e.name!)
                                    .join(', ') ??
                                '',
                            type:
                                fullAnimeController.fullAnime.value?.data?.type,
                            score: fullAnimeController
                                    .fullAnime.value?.data?.score
                                    ?.toString() ??
                                '',
                            genres: fullAnimeController
                                    .fullAnime.value?.data?.genres
                                    ?.map((e) => e.name!)
                                    .join(', ') ??
                                '',
                            description: fullAnimeController
                                .fullAnime.value?.data?.synopsis,
                            season: fullAnimeController
                                .fullAnime.value?.data?.season,
                            year: fullAnimeController
                                    .fullAnime.value?.data?.year
                                    ?.toString() ??
                                '',
                            studio: fullAnimeController
                                    .fullAnime.value?.data?.studios
                                    ?.map((e) => e.name!)
                                    .join(', ') ??
                                '',
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 180,
                      height: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  width: 200,
                                  height: 240,
                                  fit: BoxFit.cover,
                                  imageUrl: anime
                                          ?.entry?.images?.jpg?.largeImageUrl ??
                                      '',
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    color: Colors.grey[850],
                                    child: const Center(
                                      child: Icon(Icons.error,
                                          color: Colors.white),
                                    ),
                                  ),
                                  placeholder: (context, url) => Container(
                                    color: Colors.grey[850],
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ).animate().scale(),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildPlaceholderItem() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 180,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
