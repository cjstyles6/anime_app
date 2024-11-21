import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/helpers/navigation_helpers.dart';
import '../../controller/home_controller.dart';
import '../../../../common/widgets/score_card.dart';

class TopAnimeHitsWidget extends StatelessWidget {
  const TopAnimeHitsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Obx(() {
      // Early return if data is null with loading skeleton
      if (controller.isLoading.value ||
          controller.topanime.value?.data == null) {
        return _buildLoadingSkeleton();
      }

      final animeList = controller.topanime.value!.data!;
      if (animeList.isEmpty) {
        return const SizedBox.shrink();
      }

      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Hits Anime',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.TOP_HITS),
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 18,
                    color: primaryColor,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: animeList.length > 10 ? 10 : animeList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final anime = animeList[index];
                if (anime.images?.jpg?.largeImageUrl == null) {
                  return const SizedBox.shrink();
                }
                return GestureDetector(
                  onTap: () {
                    if (anime.malId != null) {
                      Get.toNamed(
                        AppRoutes.ANIME_DETAIL,
                        arguments: createAnimeDetailsArguments(
                          anime.malId.toString(),
                          index,
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
                          child: Stack(
                            children: [
                              ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.2),
                                  BlendMode.darken,
                                ),
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: CachedNetworkImage(
                                      width: 200,
                                      height: 240,
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          anime.images!.jpg!.largeImageUrl!,
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
                              Positioned(
                                bottom: 0,
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    fontSize: 50,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              if (anime.score != null)
                                ScoreCard(score: anime.score!),
                            ],
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
      );
    });
  }

  Widget _buildLoadingSkeleton() {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Hits Anime',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                ),
              ),
              const Text(
                'See all',
                style: TextStyle(
                  fontSize: 18,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 10),
                width: 180,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
