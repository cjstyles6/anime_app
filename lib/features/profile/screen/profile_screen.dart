import 'package:anime_app/features/authentication/controller/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationController controller = Get.find();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => controller.signOut(),
          child: const Text('Sign out'),
        ),
      ),
    );
  }
}
