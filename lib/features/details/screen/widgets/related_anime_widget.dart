import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../controller/anime_details_controller.dart';
import '../../controller/full_anime_controller.dart';

class RelatedAnimeWidget extends StatelessWidget {
  const RelatedAnimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fullAnimeController = Get.find<FullAnimeController>();
    final controller = Get.find<AnimeDetailsController>();

    return Obx(() {
      debugPrint(
          'Related Anime value: ${fullAnimeController.relatedAnime.value}');
      debugPrint(
          'Related Anime data: ${fullAnimeController.relatedAnime.value?.data}');
      debugPrint(
          'Related Anime length: ${fullAnimeController.relatedAnime.value?.data?.length}');

      final relatedAnimeList = fullAnimeController.relatedAnime.value?.data;
      final hasRelatedAnime =
          relatedAnimeList != null && relatedAnimeList.isNotEmpty;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Related Anime')
                  .textColor(Colors.white)
                  .fontSize(20)
                  .bold(),
              if (hasRelatedAnime)
                Text('${relatedAnimeList.length} related')
                    .textColor(Colors.grey)
                    .fontSize(14),
            ],
          ),
          10.heightBox,
          if (controller.isRelatedAnimeLoading.value)
            _buildLoadingState()
          else if (hasRelatedAnime)
            _buildRelatedAnimeList(relatedAnimeList, controller)
          else
            _buildNoRelatedAnimeState(fullAnimeController),
        ],
      );
    });
  }

  Widget _buildLoadingState() {
    return Column(
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Skeletonizer(
            enabled: true,
            child: _buildAnimeRow(
              imageUrl: 'placeholder',
              title: 'Loading...',
              enabled: true,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRelatedAnimeList(
      List<dynamic> relatedAnimeList, AnimeDetailsController controller) {
    return ListView.separated(
      separatorBuilder: (context, index) => 10.heightBox,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: relatedAnimeList.length.clamp(0, 3), // Show max 3 items
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final relatedAnime = relatedAnimeList[index];
        final imageUrl = relatedAnime.entry?.images?.jpg?.imageUrl ?? '';
        final title = relatedAnime.entry?.title ?? 'No title';

        return Skeletonizer(
          enabled: controller.isRelatedAnimeLoading.value,
          child: _buildAnimeRow(
            imageUrl: imageUrl,
            title: title,
            enabled: controller.isRelatedAnimeLoading.value,
          ),
        );
      },
    );
  }

  Widget _buildAnimeRow({
    required String imageUrl,
    required String title,
    required bool enabled,
  }) {
    return Row(
      children: [
        if (imageUrl != 'placeholder')
          CachedNetworkImage(
            width: 80,
            height: 130,
            fit: BoxFit.cover,
            imageUrl: imageUrl,
            placeholder: (context, url) => Container(
              width: 80,
              height: 130,
              color: Colors.grey.shade800,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              width: 80,
              height: 130,
              color: Colors.grey.shade800,
              child: const Icon(
                Icons.error,
                color: Colors.grey,
                size: 30,
              ),
            ),
          )
        else
          Container(
            width: 80,
            height: 130,
            color: Colors.grey.shade800,
          ),
        10.widthBox,
        Expanded(
          child: Text(title)
              .textColor(Colors.white)
              .fontSize(18)
              .fontWeight(FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildNoRelatedAnimeState(FullAnimeController fullAnimeController) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'No related anime available',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
