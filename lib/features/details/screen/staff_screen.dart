import 'package:anime_app/features/details/controller/full_anime_controller.dart';
import 'package:anime_app/utils/sizes.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffScreen extends StatelessWidget {
  const StaffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FullAnimeController controller = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('All Staffs').textColor(Colors.white).fontSize(25),
              20.heightBox,
              Expanded(
                child: ListView.builder(
                  itemCount: controller.animeStaffs.value!.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 150,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                controller.animeStaffs.value?.data?[index]
                                        .person?.images?.jpg?.imageUrl ??
                                    '',
                              ),
                            ),
                          ),
                        ),
                        10.widthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.animeStaffs.value?.data?[index].person
                                      ?.name ??
                                  '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            10.heightBox,
                            Text(
                              controller
                                      .animeStaffs.value?.data?[index].positions
                                      ?.join('\n') ??
                                  '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
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
