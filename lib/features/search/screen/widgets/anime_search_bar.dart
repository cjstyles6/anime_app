import 'package:anime_app/features/search/controller/anime_search_controller.dart';
import 'package:anime_app/routes/app_routes.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../utils/constants/colors.dart';

class AnimeSearchBar extends StatelessWidget {
  const AnimeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    AnimeSearchController controller = Get.find();
    return Row(
      children: [
        Flexible(
          child: TextField(
            controller: controller.textController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                controller.clearRecommendations();
                controller.getSearchAnime();
              } else {
                controller.getRecommendations();
              }
            },
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixIcon: const Icon(Ionicons.search, color: primaryColor),
              hintText: 'Search...',
              filled: true,
              fillColor: const Color(0xFF1E2E23),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color(0xFF2DAC55),
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        10.widthBox,
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.SORT_OR_FILTER),
          child: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: const Color(0xFF1E2E23),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Ionicons.filter,
              color: primaryColor,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
