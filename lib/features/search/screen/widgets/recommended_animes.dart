import 'package:anime_app/features/details/controller/full_anime_controller.dart';
import 'package:anime_app/features/search/controller/anime_search_controller.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../../../utils/arguments/arguments.dart';

class RecommendedAnimes extends StatelessWidget {
  const RecommendedAnimes({super.key});

  @override
  Widget build(BuildContext context) {
    AnimeSearchController controller = Get.find();
    FullAnimeController fullAnimeController = Get.find();
    return ListView(
      children: [
        const Text('Recommendations').textColor(Colors.white).fontSize(20),
        20.heightBox,
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            final recommendations =
                controller.recommendation.value?.data?[index];
            final entry = recommendations?.entry?.isNotEmpty == true
                ? recommendations!.entry![0]
                : null;
            final imageUrl = entry?.images?.jpg?.imageUrl;
            return GestureDetector(
              onTap: () {
                if (entry != null) {
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
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        width: 200,
                        height: 250,
                        fit: BoxFit.cover,
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
                  10.widthBox,
                  Expanded(
                    child: Text(
                      entry?.title ?? 'Anime Name',
                    ).fontSize(20).textColor(Colors.white).bold(),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
