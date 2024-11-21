class HomeScreenArguments {
  final int? initialTabIndex;
  final String? deepLinkPath;

  HomeScreenArguments({this.initialTabIndex, this.deepLinkPath});
}

class AnimeDetailsArguments {
  final String animeId;
  final String? title;
  final String? imageUrl;
  final String? description;
  final String? year;
  final String? studio;
  final String? season;
  final String? demographics;
  final String? type;
  final String? score;
  final String? genres;

  AnimeDetailsArguments({
    required this.animeId,
    this.title,
    this.imageUrl,
    this.description,
    this.year,
    this.studio,
    this.season,
    this.demographics,
    this.type,
    this.score,
    this.genres,
  });
}

class SearchScreenArguments {
  final String? initialQuery;
  final List<String>? initialFilters;
  final String? genre;

  SearchScreenArguments({
    this.initialQuery,
    this.initialFilters,
    this.genre,
  });
}

class SortFilterArguments {
  final List<String>? selectedGenres;
  final String? selectedSort;
  final String? selectedSeason;
  final String? selectedYear;

  SortFilterArguments({
    this.selectedGenres,
    this.selectedSort,
    this.selectedSeason,
    this.selectedYear,
  });
}

class ReleaseCalendarArguments {
  final DateTime? initialDate;
  final String? selectedSeason;

  ReleaseCalendarArguments({
    this.initialDate,
    this.selectedSeason,
  });
}

class MyListArguments {
  final String? initialCategory;
  final bool? showCompleted;

  MyListArguments({
    this.initialCategory,
    this.showCompleted,
  });
}
