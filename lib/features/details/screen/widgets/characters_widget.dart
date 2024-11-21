import 'package:anime_app/routes/app_routes.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../controller/full_anime_controller.dart';

class CharactersWidget extends StatelessWidget {
  const CharactersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fullAnimeController = Get.find<FullAnimeController>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Characters',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.CHARACTERS),
              child: const Text('See all').fontSize(18).textColor(primaryColor),
            ),
          ],
        ),
        5.heightBox,
        Obx(() {
          final characters = fullAnimeController.characters.value?.data ?? [];
          // Take only up to 10 items
          final displayCharacters = characters.take(10).toList();

          return SizedBox(
            height: 80,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10);
              },
              scrollDirection: Axis.horizontal,
              itemCount: displayCharacters.length,
              itemBuilder: (BuildContext context, int index) {
                final character = displayCharacters[index].character;
                final imageUrl = character?.images?.webp?.imageUrl;

                return SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      imageUrl: imageUrl ?? '',
                      placeholder: (context, url) => Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey.shade800,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.grey,
                        size: 50,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ],
    );
  }
}
