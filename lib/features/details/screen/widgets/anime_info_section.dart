import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/full_anime_controller.dart';

class AnimeInfoSection extends StatelessWidget {
  const AnimeInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final fullAnimeController = Get.find<FullAnimeController>();

    return Obx(() {
      final animeData = fullAnimeController.fullAnime.value?.data;
      if (animeData == null) return const SizedBox();

      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xF6161616),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // _buildInfoRow('Score', '${animeData.score ?? "N/A"}'),
            // const SizedBox(height: 8),
            _buildInfoRow('Episodes', '${animeData.episodes ?? "N/A"}'),
            const SizedBox(height: 8),
            _buildInfoRow('Rating', animeData.rating ?? "N/A"),
            const SizedBox(height: 8),
            _buildInfoRow('Duration', animeData.duration ?? "N/A"),
            const SizedBox(height: 8),
            _buildInfoRow('Duration', animeData.aired!.string ?? "N/A"),
            const SizedBox(height: 8),
            _buildInfoRow('Rank', animeData.rank?.toString() ?? "N/A"),
            const SizedBox(height: 8),
            _buildInfoRow(
                'Popularity', animeData.popularity?.toString() ?? "N/A"),
            const SizedBox(height: 8),
            _buildInfoRow(
                'Favorites', animeData.favorites?.toString() ?? "N/A"),
            const SizedBox(height: 8),
            _buildInfoRow('Members', animeData.members?.toString() ?? "N/A"),
            const SizedBox(height: 8),
            _buildInfoRow(
              'Genres',
              animeData.genres?.map((genre) => genre.name).join(', ') ?? "N/A",
            ),
          ],
        ),
      );
    });
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
