import 'package:anime_app/features/details/controller/full_anime_controller.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../utils/constants/colors.dart';

class AnimeDetailsHeader extends StatelessWidget {
  const AnimeDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final fullAnimeController = Get.find<FullAnimeController>();
    final animeData = fullAnimeController.fullAnime.value?.data;
    if (animeData == null) {
      return const SizedBox.shrink();
    }
    final demographicName =
        animeData.demographics != null && animeData.demographics!.isNotEmpty
            ? animeData.demographics![0].name
            : 'N/A';

    final studioName =
        animeData.studios != null && animeData.studios!.isNotEmpty
            ? animeData.studios![0].name
            : 'N/A';

    return Column(
      children: [
        10.heightBox,
        Row(
          children: [
            5.widthBox,
            Text('${animeData.year ?? 'No Year'} | ')
                .fontSize(14)
                .textColor(Colors.white),
            Text('${animeData.status ?? 'No Status'} | ')
                .fontSize(14)
                .textColor(Colors.white),
            5.widthBox,
            Text('${animeData.type ?? 'No Type'} |')
                .fontSize(14)
                .textColor(Colors.white),
            5.widthBox,
            const Icon(Ionicons.star, color: primaryColor, size: 15),
            5.widthBox,
            Text(
              animeData.score?.toString() ?? 'N/A',
            ).fontSize(14).textColor(Colors.white),
          ],
        ),
        10.heightBox,
        Row(
          children: [
            Text('$demographicName | ').fontSize(14).textColor(Colors.white),
            5.widthBox,
            Text('$studioName | ').fontSize(14).textColor(Colors.white),
            5.widthBox,
            Text(animeData.season ?? 'No season')
                .fontSize(14)
                .textColor(Colors.white),
          ],
        ),
      ],
    );
  }
}
