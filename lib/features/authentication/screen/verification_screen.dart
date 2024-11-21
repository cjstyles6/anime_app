import 'package:anime_app/data/repositories/signup_repository.dart';
import 'package:anime_app/utils/constants/colors.dart';
import 'package:anime_app/utils/sizes.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/authentication_controller.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationController controller = Get.find();
    SignupRepository signupRepository = Get.put(SignupRepository());

    return WillPopScope(
      // Prevent going back during verification
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/verification-green.png',
                    width: 300,
                  ),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                      text: 'A verification email has been sent to ',
                      children: [
                        TextSpan(
                          text: '${controller.emailController.text}. ',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text:
                              'Please check your inbox and click on the verification link to activate your account.',
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,
                  Obx(() => GestureDetector(
                        onTap: signupRepository.canResendEmail.value
                            ? () => signupRepository.resendVerificationEmail()
                            : null,
                        child: Container(
                          width: 90.w,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: signupRepository.canResendEmail.value
                                ? primaryColor
                                : primaryColor.withOpacity(0.5),
                          ),
                          child: Center(
                            child: signupRepository.canResendEmail.value
                                ? const Text('Resend')
                                    .textColor(Colors.white)
                                    .bold()
                                    .fontSize(18)
                                : Text('${signupRepository.resendEmailTimer.value}s')
                                    .textColor(Colors.white)
                                    .bold()
                                    .fontSize(18),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
