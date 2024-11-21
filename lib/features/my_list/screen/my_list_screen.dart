import 'package:anime_app/common/widgets/anime_appbar.dart';
import 'package:anime_app/utils/sizes.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/my_list_controller.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyListController myListController = Get.put(MyListController());

    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              children: [
                const AnimeAppbar(title: 'My List'),
                Expanded(
                  child: myListController.myAnimeList.isEmpty
                      ? const Center(
                          child: Text(
                            'No anime in your list yet',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : ListView.builder(
                          itemCount: myListController.myAnimeList.length,
                          itemBuilder: (context, index) {
                            final anime = myListController.myAnimeList[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Image container with specified width and height
                                  Container(
                                    width: 100,
                                    height: 150, // Specify your desired height
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey,
                                      image: anime.images?.jpg?.largeImageUrl !=
                                              null
                                          ? DecorationImage(
                                              image: NetworkImage(anime
                                                  .images!.jpg!.largeImageUrl!),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                    ),
                                    child:
                                        anime.images?.jpg?.largeImageUrl == null
                                            ? const Icon(Icons.error,
                                                color: Colors.white)
                                            : null,
                                  ),
                                  const SizedBox(width: 10),
                                  // Anime details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          anime.titleEnglish ??
                                              anime.title ??
                                              'No Title',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          anime.genres
                                                  ?.map((e) => e.name)
                                                  .join(', ') ??
                                              'No Genre',
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Score: ${anime.score?.toString() ?? 'N/A'}',
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                        5.heightBox,
                                        Text(
                                          anime.year?.toString() ?? 'N/A',
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                        5.heightBox,
                                        Text(
                                          anime.studios?.first.name
                                                  ?.toString() ??
                                              'N/A',
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      myListController.removeAnime(anime);
                                      Get.snackbar(
                                        'Removed',
                                        'Successfully removed ${anime.titleEnglish ?? anime.title ?? 'anime'} from my list',
                                        backgroundColor:
                                            Colors.red.withOpacity(0.3),
                                        colorText: Colors.white,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
