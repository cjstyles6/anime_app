import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../../controller/full_anime_controller.dart';

class CollapsedHeader extends StatelessWidget {
  const CollapsedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final fullAnimeController = Get.find<FullAnimeController>();

    return Obx(() {
      final animeData = fullAnimeController.fullAnime.value?.data;
      return Row(
        children: [
          Expanded(
            child: Text(
              animeData?.titleEnglish?.toString() ?? 'No Title',
              overflow: TextOverflow.ellipsis,
            ).fontSize(25).textColor(Colors.white).bold(),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Ionicons.bookmark_outline,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Ionicons.send_outline,
              color: Colors.white,
            ),
          ),
        ],
      );
    });
  }
}
