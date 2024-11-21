import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:anime_app/features/home/models/top_anime/datum.dart';

class MyListController extends GetxController {
  final myAnimeList = <Datum>[].obs;
  final storage = GetStorage();
  final String storageKey = 'myAnimeList';

  @override
  void onInit() {
    super.onInit();
    loadAnimeList();
  }

  void addAnime(Datum anime) {
    // Check if anime already exists in the list
    if (!myAnimeList.any((element) => element.malId == anime.malId)) {
      myAnimeList.add(anime);
      Get.snackbar(
        'Added',
        'Successfully added ${anime.titleEnglish ?? 'anime'} to my list',
        backgroundColor: Colors.green.withOpacity(0.3),
        colorText: Colors.white,
      );
      saveAnimeList();
    } else {
      Get.snackbar(
        'Already Added',
        '${anime.titleEnglish ?? anime.title ?? 'Anime'} is already in your list',
        backgroundColor: Colors.orange.withOpacity(0.3),
        colorText: Colors.white,
      );
    }
  }

  void removeAnime(Datum anime) {
    myAnimeList.removeWhere((element) => element.malId == anime.malId);
    saveAnimeList();
  }

  void saveAnimeList() {
    final List<String> encodedList =
        myAnimeList.map((anime) => jsonEncode(anime.toJson())).toList();
    storage.write(storageKey, encodedList);
  }

  void loadAnimeList() {
    final List<dynamic>? storedList = storage.read<List<dynamic>>(storageKey);
    if (storedList != null) {
      myAnimeList.value = storedList
          .map((animeJson) => Datum.fromJson(jsonDecode(animeJson.toString())))
          .toList();
    }
  }
}
