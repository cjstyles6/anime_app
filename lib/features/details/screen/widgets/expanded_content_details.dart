import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../utils/arguments/arguments.dart';

class ExpandedContentDetails extends StatelessWidget {
  const ExpandedContentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AnimeDetailsArguments arguments = Get.arguments as AnimeDetailsArguments;

    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            arguments.imageUrl!,
          ),
        ),
      ),
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: arguments.imageUrl!,
                height: 250,
                width: 250,
                fit: BoxFit.contain,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
