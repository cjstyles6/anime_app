import 'package:anime_app/features/home/controller/navigation_controller.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class AnimeBottomNav extends StatelessWidget {
  const AnimeBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      builder: (controller) => SalomonBottomBar(
        selectedItemColor: Colors.white,
        currentIndex: controller.currentIndex.value,
        onTap: (index) => controller.changeIndex(index),
        items: [
          SalomonBottomBarItem(
            icon: Icon(
              controller.currentIndex.value == 0
                  ? Ionicons.home
                  : Ionicons.home_outline,
              color: Colors.white,
            ),
            title: const Text('Home').textColor(Colors.white),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              controller.currentIndex.value == 1
                  ? Ionicons.calendar_clear
                  : Ionicons.calendar_clear_outline,
              color: Colors.white,
            ),
            title: const Text('Calendar').textColor(Colors.white),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              controller.currentIndex.value == 2
                  ? Ionicons.bookmark
                  : Ionicons.bookmark_outline,
              color: Colors.white,
            ),
            title: const Text('My List').textColor(Colors.white),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              controller.currentIndex.value == 3
                  ? Ionicons.person
                  : Ionicons.person_outline,
              color: Colors.white,
            ),
            title: const Text('Profile').textColor(Colors.white),
          ),
        ],
      ),
    );
  }
}
