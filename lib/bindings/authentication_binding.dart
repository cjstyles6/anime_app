// bindings/authentication_binding.dart
import 'package:get/get.dart';
import 'package:anime_app/features/authentication/controller/authentication_controller.dart';
import 'package:anime_app/data/repositories/google_repository.dart';
import 'package:anime_app/data/repositories/signup_repository.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GoogleRepository(), permanent: true);

    Get.put(SignupRepository(), permanent: true);

    // Inject AuthenticationController with GoogleRepository and SignupRepository
    Get.put(AuthenticationController(
      Get.find<GoogleRepository>(),
      Get.find<SignupRepository>(),
    ));
  }
}
