import 'package:anime_app/bindings/anime_details_binding.dart';
import 'package:anime_app/bindings/authentication_binding.dart';
import 'package:anime_app/bindings/home_binding.dart';
import 'package:anime_app/bindings/search_binding.dart';
import 'package:anime_app/bindings/upcoming_binding.dart';
import 'package:anime_app/bindings/videos_binding.dart';
import 'package:anime_app/features/authentication/screen/login_screen.dart';
import 'package:anime_app/features/authentication/screen/signup_screen.dart';
import 'package:anime_app/features/authentication/screen/verification_screen.dart';
import 'package:anime_app/features/authentication/screen/welcome_screen.dart';
import 'package:anime_app/features/details/screen/anime_details_screen.dart';
import 'package:anime_app/features/details/screen/characters_screen.dart';
import 'package:anime_app/features/details/screen/reviews_screen.dart';
import 'package:anime_app/features/details/screen/staff_screen.dart';
import 'package:anime_app/features/home/screen/new_episodes_screen.dart';
import 'package:anime_app/features/home/screen/top_hits_anime_screen.dart';
import 'package:anime_app/features/my_list/screen/my_list_screen.dart';
import 'package:anime_app/features/profile/screen/profile_screen.dart';
import 'package:anime_app/features/upcoming/screen/upcomming_anime_screen.dart';
import 'package:anime_app/features/search/screen/search_screen.dart';
import 'package:anime_app/features/search/screen/sort_or_filter_screen.dart';
import 'package:anime_app/features/videos/screen/video_screen.dart';
import 'package:anime_app/main_layout.dart';
import 'package:anime_app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../utils/arguments/arguments.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const MainLayout(),
      binding: HomeBinding(),
      arguments: HomeScreenArguments(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: AppRoutes.TOP_HITS,
      page: () => const TopHitsAnimeScreen(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.NEW_EpiSODE,
      page: () => const NewEpisodesScreen(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.SEARCH,
      page: () => const SearchScreen(),
      binding: SearchBinding(),
      transition: Transition.downToUp,
      arguments: SearchScreenArguments(),
    ),
    GetPage(
      name: AppRoutes.SORT_OR_FILTER,
      page: () => const SortOrFilterScreen(),
      binding: SearchBinding(),
      arguments: SortFilterArguments(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.RELEASE_CALENDAR,
      page: () => const UpcomingAnimeScreen(),
      binding: UpcomingBinding(),
      // arguments: ReleaseCalendarArguments(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.MY_LIST,
      page: () => const MyListScreen(),
      binding: AuthenticationBinding(),
      arguments: MyListArguments(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => const ProfileScreen(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.ANIME_DETAIL,
      page: () => const AnimeDetailsScreen(),
      binding: AnimeDetailsBinding(),
      arguments: AnimeDetailsArguments(animeId: 'mal_id'),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.CHARACTERS,
      page: () => const CharactersScreen(),
      binding: AnimeDetailsBinding(),
      arguments: AnimeDetailsArguments(animeId: 'mal_id'),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.staffs,
      page: () => const StaffScreen(),
      binding: AnimeDetailsBinding(),
      arguments: AnimeDetailsArguments(animeId: 'mal_id'),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.REVIEWS,
      page: () => ReviewsScreen(),
      binding: AnimeDetailsBinding(),
      arguments: AnimeDetailsArguments(animeId: 'mal_id'),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.VIDEOS,
      page: () => const VideoScreen(),
      binding: VideosBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => const SignupScreen(),
      // binding: VideosBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginScreen(),
      // binding: VideosBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.WELCOME,
      page: () => const WelcomeScreen(),
      binding: AuthenticationBinding(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.VERIFICATION,
      page: () => const VerificationScreen(),
      binding: AuthenticationBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
