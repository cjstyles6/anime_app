import 'package:anime_app/features/videos/controller/anime_videos_controller.dart';
import 'package:anime_app/utils/sizes.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../utils/arguments/arguments.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as AnimeDetailsArguments;
    AnimeVideosController controller = Get.put(AnimeVideosController());
    controller.getAnimeVideo(int.parse(args.animeId));
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            if (controller.animeVideo.value == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final videoIds = controller.animeVideo.value?.data?.promo
                    ?.map((promo) => promo.trailer?.youtubeId)
                    .toList() ??
                [];
            final videoTitles = controller.animeVideo.value?.data?.promo
                    ?.map((promo) => promo.title)
                    .toList() ??
                [];
            if (videoIds.isEmpty) {
              return const Center(
                child: Text(
                  'No video trailers available',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Trailers')
                      .textColor(Colors.white)
                      .fontSize(25)
                      .bold(),
                  10.heightBox,
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => 20.heightBox,
                      itemCount: videoIds.length,
                      itemBuilder: (BuildContext context, int index) {
                        final youtubeId = videoIds[index];
                        final title = videoTitles[index];
                        if (youtubeId == null) {
                          return const SizedBox.shrink();
                        }
                        YoutubePlayerController playerController =
                            YoutubePlayerController(
                          initialVideoId: youtubeId,
                          flags: const YoutubePlayerFlags(
                            autoPlay: false,
                            mute: false,
                            useHybridComposition: true,
                            showLiveFullscreenButton: false,
                          ),
                        );
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: YoutubePlayerBuilder(
                            player: YoutubePlayer(controller: playerController),
                            builder: (context, player) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    title ?? 'NA',
                                  ).bold().fontSize(14).textColor(Colors.white),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: player,
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
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
