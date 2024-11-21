import 'package:anime_app/utils/constants/colors.dart';
import 'package:anime_app/utils/sizes.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:intl/intl.dart';

import '../controller/full_anime_controller.dart';

class ReviewsScreen extends StatelessWidget {
  ReviewsScreen({super.key});
  final RxMap<int, bool> expandedStates = <int, bool>{}.obs;
  String formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('MMM dd, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final fullAnimeController = Get.find<FullAnimeController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Ionicons.arrow_back_sharp,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Reviews',
                  ).textColor(Colors.white).fontSize(25).bold(),
                ],
              ),
              10.heightBox,
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => 20.heightBox,
                  itemCount:
                      fullAnimeController.reviews.value?.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    final reviews = fullAnimeController.reviews.value?.data;
                    if (reviews == null || index >= reviews.length) {
                      return const SizedBox.shrink();
                    }
                    final review = reviews[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  review.user?.images?.webp?.imageUrl != null
                                      ? NetworkImage(
                                          review.user!.images!.webp!.imageUrl!,
                                        )
                                      : null,
                            ),
                            10.widthBox,
                            Text(review.user?.username ?? 'Anonymous')
                                .textColor(Colors.white)
                                .fontSize(18)
                                .bold(),
                            const Spacer(),
                            Text(
                              formatDate(review.date),
                            ).textColor(Colors.white),
                          ],
                        ),
                        10.heightBox,
                        Obx(() {
                          final isExpanded = expandedStates[index] ?? false;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                review.review ?? 'No review available',
                                maxLines: isExpanded ? null : 5,
                                overflow:
                                    isExpanded ? null : TextOverflow.ellipsis,
                              ).textColor(Colors.white),
                              if (review.review != null &&
                                  review.review!.length > 200)
                                GestureDetector(
                                  onTap: () {
                                    expandedStates[index] = !isExpanded;
                                  },
                                  child: Text(
                                    isExpanded ? 'Show less' : 'Show more',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          );
                        }),
                        10.heightBox,
                        Row(
                          children: [
                            const Icon(
                              Ionicons.star,
                              color: primaryColor,
                              size: 20,
                            ),
                            5.widthBox,
                            Text(review.score.toString())
                                .textColor(Colors.white),
                            const Spacer(),
                            Wrap(
                              children: review.tags!
                                  .map(
                                    (e) => Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: primaryColor),
                                      ),
                                      child: Text(e).textColor(Colors.white),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
