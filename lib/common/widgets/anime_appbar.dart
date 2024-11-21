import 'package:anime_app/routes/app_routes.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class AnimeAppbar extends StatelessWidget {
  final String title;
  final IconData? suffixIcon;
  const AnimeAppbar({super.key, required this.title, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Ionicons.arrow_back, color: Colors.white),
        ),
        Text(title).textColor(Colors.white).fontSize(20),
        const Spacer(),
        IconButton(
          onPressed: () => Get.toNamed(AppRoutes.SEARCH),
          icon: Icon(
            suffixIcon,
            color: Colors.white,
            size: 25,
          ),
        ),
      ],
    );
  }
}
