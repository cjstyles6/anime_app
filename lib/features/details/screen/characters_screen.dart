import 'package:anime_app/features/details/controller/full_anime_controller.dart';
import 'package:anime_app/utils/sizes.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FullAnimeController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Obx(() {
            final characters = controller.characters.value?.data;

            if (characters == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('All Characters')
                    .textColor(Colors.white)
                    .fontSize(25)
                    .bold(),
                20.heightBox,
                Expanded(
                  child: ListView.builder(
                    itemCount: characters.length,
                    itemBuilder: (BuildContext context, int index) {
                      final character = characters[index];
                      final voiceActor =
                          character.voiceActors?.isNotEmpty == true
                              ? character.voiceActors![0]
                              : null;

                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Character Column
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildCharacterImage(character
                                    .character?.images?.webp?.imageUrl),
                                5.heightBox,
                                Text(
                                  character.character?.name ?? 'Unknown',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            // Voice Actor Column
                            if (voiceActor != null) ...[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  _buildVoiceActorImage(
                                    voiceActor.person?.images?.jpg?.imageUrl,
                                  ),
                                  5.heightBox,
                                  Text(
                                    voiceActor.person?.name ?? 'Unknown',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildCharacterImage(String? imageUrl) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.grey[800],
        image: imageUrl != null
            ? DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl),
                onError: (exception, stackTrace) {},
              )
            : null,
      ),
      child: imageUrl == null
          ? const Icon(Icons.person, color: Colors.white54)
          : null,
    );
  }

  Widget _buildVoiceActorImage(String? imageUrl) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.grey[800],
        image: imageUrl != null
            ? DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl),
                onError: (exception, stackTrace) {},
              )
            : null,
      ),
      child: imageUrl == null
          ? const Icon(Icons.mic, color: Colors.white54)
          : null,
    );
  }
}
