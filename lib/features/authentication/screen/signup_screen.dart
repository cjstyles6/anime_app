import 'package:anime_app/features/authentication/controller/authentication_controller.dart';
import 'package:anime_app/features/authentication/screen/widgets/form_button.dart';
import 'package:anime_app/features/authentication/screen/widgets/form_field_widget.dart';
import 'package:anime_app/utils/constants/colors.dart';
import 'package:anime_app/utils/sizes.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../routes/app_routes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationController controller = Get.find();
    return Container(
      width: double.infinity,
      height: 1.sh,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF00411B),
            Colors.black,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Get.toNamed(AppRoutes.WELCOME),
            icon: const Icon(Ionicons.arrow_back_outline, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/anime-image-1.png',
                        width: 150,
                      ),
                      Image.asset(
                        'assets/images/anime-image-3.png',
                        width: 160,
                      ),
                    ],
                  ),
                  10.heightBox,
                  const Text('アカウントを作成する')
                      .textColor(Colors.white)
                      .bold()
                      .fontSize(30.sp),
                  const Text('Create Account')
                      .textColor(Colors.white)
                      .fontSize(18.sp),
                  30.heightBox,
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FormFieldWidget(
                          labelText: 'Username',
                          hintText: 'CeeJay',
                        ),
                        FormFieldWidget(
                          controller: controller.emailController,
                          labelText: 'Email',
                          hintText: 'johndoe@gmail.com',
                        ),
                        FormFieldWidget(
                          controller: controller.passwordController,
                          labelText: 'Password',
                          hintText: '*********',
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,
                  FormButton(
                    onTap: () async {
                      if (controller.emailController.text.isNotEmpty &&
                          controller.passwordController.text.isNotEmpty) {
                        await controller.signupWithEmailAndPassword(
                          controller.emailController.text,
                          controller.passwordController.text,
                        );
                      } else {
                        Get.snackbar(
                          'Error',
                          'Please fill in all fields',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                    text: 'Create Account',
                    bgColor: const Color(0xFF005024),
                  ),
                  20.heightBox,
                  Row(
                    children: [
                      const Text('Already have an account? ')
                          .textColor(Colors.white)
                          .fontSize(14.sp),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.LOGIN),
                        child: const Text('log in')
                            .textColor(primaryColor)
                            .fontSize(14.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
