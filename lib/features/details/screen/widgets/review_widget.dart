import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/constants/colors.dart';
import '../../controller/anime_details_controller.dart';
import '../../controller/full_anime_controller.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fullAnimeController = Get.find<FullAnimeController>();
    final controller = Get.find<AnimeDetailsController>();

    return Obx(
      () {
        final hasReviews =
            fullAnimeController.reviews.value?.data?.isNotEmpty ?? false;

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Reviews',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (hasReviews || controller.isReviewsLoading.value)
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.REVIEWS),
                    child: const Text('See all')
                        .fontSize(18)
                        .textColor(primaryColor),
                  ),
              ],
            ),
            10.heightBox,
            Skeletonizer(
              enabled: controller.isReviewsLoading.value,
              child: hasReviews || controller.isReviewsLoading.value
                  ? _buildReviewContent(fullAnimeController)
                  : _buildNoReviewsContent(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildReviewContent(FullAnimeController fullAnimeController) {
    final review = fullAnimeController.reviews.value?.data?[0];

    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xF6161616),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                  review?.user?.images?.webp?.imageUrl ??
                      'https://placehold.co/50x50',
                ),
              ),
              5.widthBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review?.user?.username ?? 'Username',
                    ).textColor(Colors.white).fontSize(18).bold(),
                    Row(
                      children: [
                        const Icon(
                          Ionicons.star,
                          color: primaryColor,
                          size: 15,
                        ),
                        5.widthBox,
                        Text(
                          review?.score?.toString() ?? '5.0',
                        ).textColor(Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          10.heightBox,
          Text(
            review?.review ??
                'This is a sample review content that will be shown while loading...',
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ).textColor(Colors.white),
        ],
      ),
    );
  }

  Widget _buildNoReviewsContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xF6161616),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Column(
        children: [
          Icon(
            Ionicons.document_text_outline,
            color: Colors.white54,
            size: 48,
          ),
          SizedBox(height: 8),
          Text(
            'No reviews available yet',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
