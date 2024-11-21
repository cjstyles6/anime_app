import 'package:anime_app/features/search/model/search_anime/datum.dart';
import 'package:anime_app/features/details/model/full_anime/data.dart';
import 'package:anime_app/features/details/model/full_anime/genre.dart'
    as full_genre;
import 'package:anime_app/features/search/model/search_anime/genre.dart'
    as search_genre;
import 'package:anime_app/features/details/model/full_anime/studio.dart'
    as full_studio;
import 'package:anime_app/features/search/model/search_anime/studio.dart'
    as search_studio;

extension DataToDatumConverter on Data {
  Datum toDatum() {
    return Datum(
      malId: malId,
      url: url,
      // images: images, // Make sure the images field types match
      // trailer: trailer, // Make sure the trailer field types match
      // approved: approved,
      // titles: titles, // Make sure the titles field types match
      title: title,
      titleEnglish: titleEnglish,
      titleJapanese: titleJapanese,
      titleSynonyms: titleSynonyms,
      type: type,
      source: source,
      episodes: episodes,
      status: status,
      airing: airing,
      // aired: aired, // Make sure the aired field types match
      duration: duration,
      rating: rating,
      score: score,
      scoredBy: scoredBy,
      rank: rank,
      popularity: popularity,
      members: members,
      favorites: favorites,
      synopsis: synopsis,
      background: background,
      season: season,
      year: year,
      // broadcast: broadcast, // Make sure the broadcast field types match
      // producers: producers?.map((producer) => producer.toSearchProducer()).toList(),
      licensors: licensors,
      studios: studios?.map((studio) => studio.toSearchStudio()).toList(),
      genres: genres?.map((genre) => genre.toSearchGenre()).toList(),
      // explicit: explicit,
      // themes: themes?.map((theme) => theme.toSearchTheme()).toList(),
      // demographics: demographics?.map((demographic) => demographic.toSearchDemographic()).toList(),
    );
  }
}

// Add these extension methods to convert between types
extension StudioConverter on full_studio.Studio {
  search_studio.Studio toSearchStudio() {
    return search_studio.Studio(
      malId: malId,
      type: type,
      name: name,
      url: url,
    );
  }
}

extension GenreConverter on full_genre.Genre {
  search_genre.Genre toSearchGenre() {
    return search_genre.Genre(
      malId: malId,
      type: type,
      name: name,
      url: url,
    );
  }
}
