import 'package:anime_app/features/authentication/screen/widgets/form_button.dart';
import 'package:anime_app/features/authentication/screen/widgets/form_field_widget.dart';
import 'package:anime_app/routes/app_routes.dart';
import 'package:anime_app/utils/constants/colors.dart';
import 'package:anime_app/utils/sizes.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        'assets/images/anime-image-4.png',
                        width: 150,
                      ),
                      Column(
                        children: [
                          const Text('ログイン')
                              .textColor(Colors.white)
                              .bold()
                              .fontSize(30.sp),
                          const Text('Log in')
                              .textColor(Colors.white)
                              .bold()
                              .fontSize(18.sp),
                        ],
                      ),
                    ],
                  ),
                  30.heightBox,
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const FormFieldWidget(
                          labelText: 'Email',
                          hintText: 'johndoe@gmail.com',
                        ),
                        const FormFieldWidget(
                          labelText: 'Password',
                          hintText: '*********',
                        ),
                        const Text(
                          'Forgot Password?',
                          textAlign: TextAlign.right,
                        ).textColor(Colors.white),
                      ],
                    ),
                  ),
                  20.heightBox,
                  const FormButton(
                    text: 'Log in',
                    bgColor: Color(0xFF005024),
                  ),
                  20.heightBox,
                  Row(
                    children: [
                      const Text('Dont\'t have an account? ')
                          .textColor(Colors.white)
                          .fontSize(14.sp),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.SIGNUP),
                        child: const Text('create account')
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
