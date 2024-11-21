import 'package:anime_app/features/upcoming/controller/upcoming_anime_controller.dart';
import 'package:anime_app/utils/sizes.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UpcomingAnimeScreen extends StatelessWidget {
  const UpcomingAnimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UpcomingAnimeController controller = Get.put(UpcomingAnimeController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Upcoming Animes')
                  .textColor(Colors.white)
                  .fontSize(25),
              20.heightBox,
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (controller.error.value.isNotEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Error: ${controller.error.value}',
                            style: const TextStyle(color: Colors.red),
                          ),
                          ElevatedButton(
                            onPressed: controller.getUpcomingAnime,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }
                  if (controller.upcomingAnime.value?.data == null ||
                      controller.upcomingAnime.value!.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        'No upcoming anime found',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount:
                        controller.upcomingAnime.value?.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      final animeData =
                          controller.upcomingAnime.value?.data?[index];
                      final imageUrl =
                          animeData?.images?.webp?.largeImageUrl ?? '';
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: SizedBox(
                          height: 250.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  width: 150.w,
                                  height: 250.h,
                                  child: CachedNetworkImage(
                                    imageUrl: imageUrl,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              16.widthBox,
                              Expanded(
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        animeData?.titleEnglish ?? 'N/A',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      8.heightBox,
                                      if (animeData?.synopsis != null)
                                        Text(
                                          animeData!.synopsis!,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      10.heightBox,
                                      Text(
                                        animeData?.genres
                                                ?.map((e) => e.name)
                                                .join(' ') ??
                                            '',
                                      ).textColor(Colors.grey),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
