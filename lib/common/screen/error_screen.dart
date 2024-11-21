import 'package:anime_app/features/home/controller/home_controller.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Something went wrong. Please try again later.',
              textAlign: TextAlign.center,
            ).fontSize(15).textColor(Colors.white),
            10.heightBox,
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () => controller.loadAnimeData(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Retry').fontSize(16).textColor(Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
