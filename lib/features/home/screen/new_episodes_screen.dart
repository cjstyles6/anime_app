import 'package:anime_app/common/widgets/anime_appbar.dart';
import 'package:anime_app/features/home/controller/home_controller.dart';
import 'package:anime_app/utils/sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/arguments/arguments.dart';
import '../../details/controller/full_anime_controller.dart';

class NewEpisodesScreen extends StatelessWidget {
  const NewEpisodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    FullAnimeController fullAnimeController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              const AnimeAppbar(
                title: 'New Episode Release',
                suffixIcon: Ionicons.search,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: controller.newEpisode.value!.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final anime = controller.newEpisode.value!.data![index];
                    return GestureDetector(
                      onTap: () {
                        final entry = anime.entry!;
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
                              type: fullAnimeController
                                  .fullAnime.value?.data?.type,
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
                        margin: const EdgeInsets.only(bottom: 15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            width: 150,
                            height: 240,
                            fit: BoxFit.cover,
                            imageUrl: anime.entry!.images!.jpg!.largeImageUrl!,
                          ),
                        ),
                      ).animate().scale(
                            delay: Duration(milliseconds: index * 10),
                          ),
                    );
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
