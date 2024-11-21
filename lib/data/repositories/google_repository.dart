// lib/data/repositories/google_repository.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:anime_app/routes/app_routes.dart';

class GoogleRepository extends GetxController {
  static GoogleRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  final Rx<User?> _firebaseUser = Rx<User?>(null);
  RxBool isLoading = false.obs;
  bool _initialAuthCheckDone = false;

  @override
  void onReady() {
    super.onReady();
    _firebaseUser.value = _auth.currentUser;
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _handleAuthStateChange);
  }

  void _handleAuthStateChange(User? user) {
    if (!_initialAuthCheckDone) {
      setInitialScreen(user);
      _initialAuthCheckDone = true;
    } else {
      // Handle subsequent auth state changes
      setInitialScreen(user);
    }
  }

  void setInitialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed(AppRoutes.WELCOME);
    } else {
      Get.offAllNamed(AppRoutes.HOME);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        isLoading.value = false;
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        setInitialScreen(userCredential.user);
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signOutFromGoogle() async {
    try {
      await Future.wait([
        FirebaseAuth.instance.signOut(),
        GoogleSignIn().signOut(),
      ]);
      setInitialScreen(null);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Rx<User?> get firebaseUser => _firebaseUser;

  set firebaseUser(Rx<User?> user) => _firebaseUser.value = user.value;
}
