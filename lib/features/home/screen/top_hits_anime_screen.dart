import 'package:anime_app/common/widgets/anime_appbar.dart';
import 'package:anime_app/common/widgets/score_card.dart';
import 'package:anime_app/features/home/controller/home_controller.dart';
import 'package:anime_app/routes/app_routes.dart';
import 'package:anime_app/utils/helpers/navigation_helpers.dart';
import 'package:anime_app/utils/sizes.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class TopHitsAnimeScreen extends StatelessWidget {
  const TopHitsAnimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              const AnimeAppbar(
                title: 'Top Hits Anime',
                suffixIcon: Ionicons.search,
              ),
              10.heightBox,
              Expanded(
                child: ListView.builder(
                  itemCount: controller.topanime.value?.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    final anime = controller.topanime.value!.data![index];
                    return Row(
                      children: [
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  AppRoutes.ANIME_DETAIL,
                                  arguments: createAnimeDetailsArguments(
                                    anime.malId.toString(),
                                    index,
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    width: 150,
                                    height: 240,
                                    fit: BoxFit.cover,
                                    imageUrl: anime.images!.jpg!.largeImageUrl!,
                                    errorWidget: (context, url, error) =>
                                        Container(
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
                            ScoreCard(score: anime.score!),
                          ],
                        ),
                        10.widthBox,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                anime.titleEnglish ?? 'No Title',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              20.heightBox,
                              Text.rich(
                                TextSpan(
                                  text: '${anime.year?.toString() ?? 'N/A'} | ',
                                  style: const TextStyle(color: Colors.grey),
                                  children: [
                                    TextSpan(
                                      text: anime.season ?? '',
                                    ),
                                  ],
                                ),
                              ),
                              20.heightBox,
                              Text(
                                anime.genres!
                                    .map((genre) => genre.name)
                                    .join(', '),
                              ).textColor(Colors.grey),
                              10.heightBox,
                              Text(
                                anime.studios?.first.name ?? 'Unknown Studio',
                              ).textColor(Colors.grey),
                              10.heightBox,
                              // SizedBox(
                              //   width: 150,
                              //   child: AnimeButton(
                              //     text: 'My List',
                              //     bgColor: primaryColor,
                              //     icon: const Icon(Ionicons.add,
                              //         color: Colors.white),
                              //     onPressed: () {
                              //       myListController.addAnime(anime);
                              //     },
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ).animate().scale(
                          delay: Duration(milliseconds: index * 10),
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
