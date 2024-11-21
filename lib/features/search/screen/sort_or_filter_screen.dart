import 'package:anime_app/common/widgets/anime_appbar.dart';
import 'package:anime_app/features/search/screen/widgets/sort_and_filter_button.dart';
import 'package:anime_app/utils/sizes.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/anime_search_controller.dart';

class SortOrFilterScreen extends StatelessWidget {
  const SortOrFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AnimeSearchController controller = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AnimeAppbar(title: 'Sort & Filter'),
                10.heightBox,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSection(
                        'Type',
                        controller.selectType.value,
                        [
                          'tv',
                          'movie',
                          'ova',
                          'special',
                          'ona',
                          'music',
                          'tv_special'
                        ],
                        (value) {
                          controller.toggleFilterValue(
                              controller.selectType, value);
                        },
                      ),
                      30.heightBox,
                      _buildSection(
                        'Order By',
                        controller.selectOrderBy.value,
                        [
                          'score',
                          'scored_by',
                          'rank',
                          'popularity',
                          'members',
                          'favorites'
                        ],
                        (value) {
                          controller.toggleFilterValue(
                              controller.selectOrderBy, value);
                        },
                      ),
                      30.heightBox,
                      _buildSection(
                        'Status',
                        controller.selectStatus.value,
                        ['title', 'episodes', 'airing'],
                        (value) {
                          controller.toggleFilterValue(
                              controller.selectStatus, value);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSection(
    String title,
    String selectedValue,
    List<String> options,
    Function(String) onTap,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title).fontSize(20).textColor(Colors.white),
        10.heightBox,
        Wrap(
          runSpacing: 10,
          children: options.map((option) {
            return SortAndFilterButton(
              text: option,
              selected: selectedValue == option,
              onTap: () => onTap(option),
            );
          }).toList(),
        ),
      ],
    );
  }
}
