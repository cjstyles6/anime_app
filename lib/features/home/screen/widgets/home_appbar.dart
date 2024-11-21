import 'package:anime_app/common/widgets/anime_button.dart';
import 'package:anime_app/features/home/controller/home_controller.dart';
// import 'package:anime_app/features/home/controller/my_list_controller.dart';  // Add this import
import 'package:anime_app/features/home/models/top_anime/datum.dart'; // Add this import
import 'package:anime_app/features/home/models/top_anime/genre.dart';
import 'package:anime_app/features/home/models/top_anime/images.dart';
import 'package:anime_app/features/home/models/top_anime/jpg.dart';
import 'package:anime_app/features/home/models/top_anime/studio.dart';
import 'package:anime_app/routes/app_routes.dart';
import 'package:anime_app/utils/constants/colors.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../utils/arguments/arguments.dart';
import '../../../my_list/controller/my_list_controller.dart';
import '../../../videos/screen/video_screen.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    MyListController myListController =
        Get.find<MyListController>(); // Add this line

    Future<void> handleWatchTrailer(int animeId) async {
      Get.to(() => const VideoScreen(),
          arguments: AnimeDetailsArguments(animeId: animeId.toString()));
    }

    void handleAddToMyList(Map<String, String> animeData) {
      // Create a Datum object from the random anime data
      final anime = Datum(
        malId: int.parse(animeData['mal_id'] ?? '0'),
        title: animeData['title'],
        titleEnglish: animeData['title'],
        synopsis: animeData['synopsis'],
        year: int.tryParse(animeData['year'] ?? ''),
        score: double.tryParse(animeData['score'] ?? ''),
        images: Images(
          jpg: Jpg(
            largeImageUrl: animeData['image'],
          ),
        ),
        studios: [Studio(name: animeData['studio'])],
        genres: (animeData['genres'] ?? '')
            .split(', ')
            .map((name) => Genre(name: name))
            .toList(),
      );

      // Add the anime to MyList
      myListController.addAnime(anime);
    }

    final randomAnime = controller.getRandomAnime();
    if (randomAnime == null) {
      return Container(
        height: 350,
        color: Colors.grey[900],
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }

    return Stack(
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(
            AppRoutes.ANIME_DETAIL,
            arguments: AnimeDetailsArguments(
              animeId: randomAnime['mal_id']!,
              title: randomAnime['title']!,
              imageUrl: randomAnime['image']!,
              description: randomAnime['synopsis']!,
              year: randomAnime['year']!,
              studio: randomAnime['studio']!,
              season: randomAnime['season']!,
              demographics: randomAnime['demographics']!,
              type: randomAnime['type'],
              score: randomAnime['score'],
              genres: randomAnime['genres'],
            ),
          ),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
            child: ClipRRect(
              child: CachedNetworkImage(
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
                imageUrl: randomAnime['image']!,
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          right: 10,
          child: Row(
            children: [
              IconButton(
                onPressed: () => Get.toNamed(AppRoutes.SEARCH),
                icon: const Icon(
                  Ionicons.search_outline,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Ionicons.notifications_outline,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 80,
          left: 10,
          child: SizedBox(
            width: 0.9.sw,
            child: Text(
              randomAnime['title']!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ).fontSize(35).fontWeight(FontWeight.bold).textColor(Colors.white),
          ),
        ),
        Positioned(
          bottom: 60,
          left: 10,
          child: Text(randomAnime['genres']!)
              .fontSize(18)
              .fontWeight(FontWeight.bold)
              .textColor(Colors.white),
        ),
        Positioned(
          bottom: 15,
          left: 10,
          child: Row(
            children: [
              AnimeButton(
                text: 'Watch trailer',
                icon: const Icon(Ionicons.play_circle, color: Colors.white),
                bgColor: primaryColor,
                onPressed: () => handleWatchTrailer(
                  int.parse(randomAnime['mal_id']!),
                ),
              ),
              10.widthBox,
              AnimeButton(
                  text: 'My List',
                  icon: const Icon(Ionicons.add, color: Colors.white),
                  borderColor: Colors.white,
                  onPressed: () {
                    handleAddToMyList(randomAnime);
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
