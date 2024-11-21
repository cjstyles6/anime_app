import 'package:anime_app/features/authentication/controller/authentication_controller.dart';
import 'package:anime_app/features/authentication/screen/widgets/form_button.dart';
// import 'package:anime_app/routes/app_routes.dart';
import 'package:anime_app/utils/sizes.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationController controller = Get.find();
    return Container(
      height: 1.sh,
      width: 1.sw,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.33),
            BlendMode.darken,
          ),
          image: const AssetImage('assets/images/wallpaper-1.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/animexstyle.png',
                fit: BoxFit.contain,
                width: 400,
                color: Colors.white,
                // height: 400,
              ),
              const Text(
                'Welcome to AnimeXStyles! Explore anime details, watch exciting trailers, and discover new favorites.',
                textAlign: TextAlign.center,
              ).textColor(Colors.white).bold().fontSize(16),
              10.heightBox,
              // FormButton(
              //   text: 'Create Account',
              //   bgColor: const Color(0xFF005024),
              //   onTap: () => Get.offNamed(AppRoutes.SIGNUP),
              // ),
              // 10.heightBox,
              // FormButton(
              //   text: 'Log in',
              //   borderColor: Colors.white,
              //   onTap: () => Get.toNamed(AppRoutes.LOGIN),
              // ),
              // 5.heightBox,
              // const Text('OR').textColor(Colors.white).bold().fontSize(20),
              // 5.heightBox,
              FormButton(
                text: 'Continue with google',
                onTap: () => controller.signInWithGoogle(),
                bgColor: const Color(0xFF005024),
                icon: Image.asset(
                  'assets/images/anime-logo-two.png',
                  width: 40,
                ),
                padding: 5,
              ),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
