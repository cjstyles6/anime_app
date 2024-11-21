import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/widgets/anime_bottom_nav.dart';
import 'features/home/controller/navigation_controller.dart';
import 'features/home/screen/home_screen.dart';
import 'features/my_list/screen/my_list_screen.dart';
import 'features/profile/screen/profile_screen.dart';
import 'features/upcoming/screen/upcomming_anime_screen.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: const [
              HomeScreen(),
              UpcomingAnimeScreen(),
              MyListScreen(),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: const AnimeBottomNav(),
        );
      },
    );
  }
}
