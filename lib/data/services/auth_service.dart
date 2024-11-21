import 'package:anime_app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((User? firebaseUser) {
      if (firebaseUser != null) {
        user.value = firebaseUser;
        Get.offAllNamed(AppRoutes.HOME);
      } else {
        user.value = null;
        Get.offAllNamed(AppRoutes.WELCOME);
      }
    });
  }

  bool isUserLoggedIn() {
    return user.value != null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    user.value = null;
    Get.offAllNamed(AppRoutes.WELCOME);
  }
}
