import 'package:anime_app/common/widgets/score_card.dart';
import 'package:anime_app/features/search/controller/anime_search_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../../../utils/arguments/arguments.dart';
import '../../../details/controller/full_anime_controller.dart';

class AnimeResults extends StatelessWidget {
  const AnimeResults({super.key});

  @override
  Widget build(BuildContext context) {
    AnimeSearchController controller = Get.find();
    FullAnimeController fullAnimeController = Get.find();
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 0.7,
      ),
      shrinkWrap: true,
      itemCount: controller.searchAnime.value!.data!.length - 1,
      itemBuilder: (BuildContext context, int index) {
        final anime = controller.searchAnime.value?.data![index];
        final imageUrl = anime?.images!.jpg!.largeImageUrl;
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                if (anime != null) {
                  Get.toNamed(
                    AppRoutes.ANIME_DETAIL,
                    arguments: AnimeDetailsArguments(
                      animeId: anime.malId?.toString() ?? '',
                      title: anime.title ?? '',
                      imageUrl: anime.images?.jpg?.largeImageUrl ?? '',
                      demographics: fullAnimeController
                              .fullAnime.value?.data?.demographics
                              ?.map((e) => e.name!)
                              .join(', ') ??
                          '',
                      type: fullAnimeController.fullAnime.value?.data?.type,
                      score: fullAnimeController.fullAnime.value?.data?.score
                              ?.toString() ??
                          '',
                      genres: fullAnimeController.fullAnime.value?.data?.genres
                              ?.map((e) => e.name!)
                              .join(', ') ??
                          '',
                      description:
                          fullAnimeController.fullAnime.value?.data?.synopsis,
                      season: fullAnimeController.fullAnime.value?.data?.season,
                      year: fullAnimeController.fullAnime.value?.data?.year
                              ?.toString() ??
                          '',
                      studio: fullAnimeController.fullAnime.value?.data?.studios
                              ?.map((e) => e.name!)
                              .join(', ') ??
                          '',
                    ),
                  );
                }
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: imageUrl ?? '',
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey,
                      child: const Icon(Icons.error),
                    ),
                    placeholder: (context, url) => Container(
                      color: Colors.grey,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ScoreCard(score: anime?.score?.toDouble() ?? 0.0),
          ],
        );
      },
    );
  }
}
