import 'package:anime_app/common/widgets/anime_button.dart';
import 'package:anime_app/features/details/screen/widgets/characters_widget.dart';
import 'package:anime_app/features/details/screen/widgets/related_anime_widget.dart';
import 'package:anime_app/features/details/screen/widgets/review_widget.dart';
import 'package:anime_app/features/home/screen/widgets/staffs_widget.dart';
import 'package:anime_app/utils/arguments/arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sliver_snap/sliver_snap.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import '../../my_list/controller/my_list_controller.dart';
import '../../videos/screen/video_screen.dart';
import '../controller/full_anime_controller.dart';
import '../controller/anime_details_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/sizes.dart';
import 'widgets/anime_details_header.dart';
import 'widgets/anime_info_section.dart';
import 'widgets/collapsed_header.dart';
import 'widgets/expanded_content_details.dart';

class AnimeDetailsScreen extends StatelessWidget {
  const AnimeDetailsScreen({super.key});

  bool _hasTextOverflow(
      String text, TextStyle style, double maxWidth, int maxLines) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);

    return textPainter.didExceedMaxLines;
  }

  void _handleWatchTrailer(int animeId) {
    Get.to(() => const VideoScreen(),
        arguments: AnimeDetailsArguments(animeId: animeId.toString()));
  }

  //  Datum convertDataToDatum(Data data) {
  //   return data.toDatum();
  // }

  Widget _buildSynopsisSection(
    BuildContext context,
    AnimeDetailsController controller,
    String? synopsis,
  ) {
    final textStyle = TextStyle(
      color: Colors.white.withOpacity(0.7),
      fontSize: 14,
      height: 1.5,
    );

    final hasOverflow = _hasTextOverflow(
      synopsis ?? 'No description available',
      textStyle,
      MediaQuery.of(context).size.width - (2 * defaultPadding),
      5,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          synopsis ?? 'No description available',
          maxLines: controller.isTextExpanded.value ? null : 5,
          overflow: controller.isTextExpanded.value
              ? TextOverflow.visible
              : TextOverflow.ellipsis,
          style: textStyle,
        ),
        if (hasOverflow)
          GestureDetector(
            onTap: controller.toggleTextExpanded,
            child: Text(
              controller.isTextExpanded.value ? 'Show less' : 'Show more',
              style: const TextStyle(
                color: primaryColor,
                fontSize: 14,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AnimeDetailsController>();
    final fullAnimeController = Get.find<FullAnimeController>();
    final myListController = Get.find<MyListController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadAnimeDetails();
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: SliverSnap(
        forceElevated: true,
        collapsedBackgroundColor: Colors.black,
        expandedBackgroundColor: Colors.transparent,
        expandedContentHeight: 300,
        onCollapseStateChanged: (isCollapsed, scrollingOffset, maxExtent) {
          controller.isCollapsed.value = isCollapsed;
        },
        expandedContent: const ExpandedContentDetails(),
        collapsedContent: const CollapsedHeader(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Obx(() {
              final animeData = fullAnimeController.fullAnime.value?.data;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.heightBox,
                  if (!controller.isCollapsed.value)
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            animeData?.titleEnglish ?? 'No Title',
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
                    ),
                  5.heightBox,
                  // In AnimeDetailsScreen class, update the Row containing the My List button:
                  Row(
                    children: [
                      AnimeButton(
                        text: 'Watch Trailer',
                        bgColor: primaryColor,
                        icon: const Icon(Ionicons.play_circle,
                            color: Colors.white),
                        onPressed: () =>
                            _handleWatchTrailer(animeData?.malId ?? 5),
                      ),
                      5.widthBox,
                      AnimeButton(
                        text: 'My List',
                        icon: const Icon(Ionicons.add, color: Colors.white),
                        borderColor: primaryColor,
                        onPressed: () {
                          if (animeData != null) {
                            final datumAnime = animeData.toDatum();
                            myListController.addAnime(datumAnime);
                          } else {
                            Get.snackbar(
                              'Error',
                              'Unable to add anime to list',
                              backgroundColor: Colors.red.withOpacity(0.3),
                              colorText: Colors.white,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  10.heightBox,
                  Skeletonizer(
                    enabled: controller.isLoading.value,
                    child: const AnimeDetailsHeader(),
                  ),
                  20.heightBox,
                  if (animeData != null || controller.isLoading.value)
                    Skeletonizer(
                      enabled: controller.isLoading.value,
                      child: _buildSynopsisSection(
                        context,
                        controller,
                        animeData?.synopsis,
                      ),
                    ),
                  20.heightBox,
                  Skeletonizer(
                    enabled: controller.isLoading.value,
                    child: const AnimeInfoSection(),
                  ),
                  20.heightBox,
                  Skeletonizer(
                    enabled: controller.isCharactersLoading.value,
                    child: const CharactersWidget(),
                  ),
                  20.heightBox,
                  Skeletonizer(
                    enabled: controller.isStaffLoading.value,
                    child: const StaffsWidget(),
                  ),
                  20.heightBox,
                  Skeletonizer(
                    enabled: controller.isRelatedAnimeLoading.value,
                    child: const RelatedAnimeWidget(),
                  ),
                  20.heightBox,
                  Skeletonizer(
                    enabled: controller.isReviewsLoading.value,
                    child: const ReviewWidget(),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
