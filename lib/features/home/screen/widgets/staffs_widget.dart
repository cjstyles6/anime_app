import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../../../utils/constants/colors.dart';
import '../../../details/controller/full_anime_controller.dart';

class StaffsWidget extends StatelessWidget {
  const StaffsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fullAnimeController = Get.find<FullAnimeController>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Staffs',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.staffs),
              child: const Text('See all').fontSize(18).textColor(primaryColor),
            ),
          ],
        ),
        Obx(() {
          final staffs = fullAnimeController.animeStaffs.value?.data ?? [];
          final displayStaffs = staffs.take(10).toList();

          return SizedBox(
            height: 80,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10);
              },
              scrollDirection: Axis.horizontal,
              itemCount: displayStaffs.length,
              itemBuilder: (BuildContext context, int index) {
                final imageUrl =
                    displayStaffs[index].person?.images?.jpg?.imageUrl;

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
