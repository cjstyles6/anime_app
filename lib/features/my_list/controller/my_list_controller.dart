import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anime_app/features/details/model/full_anime/full_anime.dart';

class MyListController extends GetxController {
  // Observable list to store anime in the user's list
  final RxList<Data> myAnimeList = <Data>[].obs;

  // Method to add an anime to the list
  void addAnime(Data anime) {
    // Check if the anime is already in the list to prevent duplicates
    if (!myAnimeList
        .any((existingAnime) => existingAnime.malId == anime.malId)) {
      myAnimeList.add(anime);
      Get.snackbar(
        'Added to List',
        'Successfully added ${anime.titleEnglish ?? anime.title ?? 'anime'} to my list',
        backgroundColor: Colors.green.withOpacity(0.3),
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Already in List',
        '${anime.titleEnglish ?? anime.title ?? 'Anime'} is already in your list',
        backgroundColor: Colors.orange.withOpacity(0.3),
        colorText: Colors.white,
      );
    }
  }

  // Method to remove an anime from the list
  void removeAnime(Data anime) {
    myAnimeList
        .removeWhere((existingAnime) => existingAnime.malId == anime.malId);
  }

  // Method to check if an anime is already in the list
  bool isAnimeInList(Data anime) {
    return myAnimeList
        .any((existingAnime) => existingAnime.malId == anime.malId);
  }
}
