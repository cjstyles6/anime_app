// utils/navigation_helpers.dart
import 'package:anime_app/features/home/controller/home_controller.dart';
import 'package:anime_app/utils/arguments/arguments.dart';
import 'package:get/get.dart';

AnimeDetailsArguments createAnimeDetailsArguments(
  var anime,
  var index,
) {
  HomeController controller = Get.find();
  final anime = controller.topanime.value!.data![index];

  return AnimeDetailsArguments(
    animeId: anime.malId.toString(),
    title: anime.titleEnglish ?? 'Unknown Title',
    imageUrl: anime.images?.jpg?.largeImageUrl ?? '',
    description: anime.synopsis ?? 'No Description',
    year: anime.aired?.prop?.from?.year?.toString() ?? 'Unknown Year',
    studio: anime.studios?.isNotEmpty == true
        ? anime.studios![0].name!
        : 'Unknown Studio',
    season: anime.season ?? 'Unknown Season',
    demographics: anime.demographics?.isNotEmpty == true
        ? anime.demographics!
            .firstWhere((element) => element.name != null,
                orElse: () => anime.demographics![0])
            .name!
        : 'No Demographics',
    genres: anime.genres?.map((genre) => genre.name).join(', ') ?? 'No Genres',
    type: anime.type ?? 'Unknown Type',
    score: anime.score?.toString() ?? 'No Score',
  );
}
