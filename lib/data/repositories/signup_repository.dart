import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class SignupRepository extends GetxController {
  SignupRepository get instance => Get.find();

  final auth = FirebaseAuth.instance;
  RxBool isEmailSent = false.obs;
  RxBool canResendEmail = false.obs;
  RxInt resendEmailTimer = 0.obs;
  RxBool isLoading = false.obs;

  final Rx<User?> _firebaseUser = Rx<User?>(null);
  Timer? _verificationCheckTimer;
  Timer? _resendTimer;

  Rx<User?> get firebaseUser => _firebaseUser;
  set firebaseUser(Rx<User?> user) => _firebaseUser.value = user.value;

  @override
  void onReady() {
    super.onReady();
    _firebaseUser.value = auth.currentUser;
    firebaseUser.bindStream(auth.userChanges());
  }

  Future<void> signupWithEmailAndPassword(String email, String password) async {
    try {
      isLoading.value = true;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await sendVerificationEmail(userCredential.user!);
        isEmailSent.value = true;
        // Navigate directly to the verification screen
        Get.offAllNamed(AppRoutes.VERIFICATION);
        startEmailVerificationCheck(); // Start checking for email verification
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> sendVerificationEmail(User user) async {
    if (!user.emailVerified) {
      await user.sendEmailVerification();
      startResendEmailTimer();
      canResendEmail.value = false;
    }
  }

  void startResendEmailTimer() {
    resendEmailTimer.value = 60;
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (resendEmailTimer.value > 0) {
          resendEmailTimer.value--;
        } else {
          canResendEmail.value = true;
          timer.cancel();
        }
      },
    );
  }

  Future<void> resendVerificationEmail() async {
    final user = auth.currentUser;
    if (user != null && canResendEmail.value) {
      try {
        await sendVerificationEmail(user);
        Get.snackbar(
          'Success',
          'Verification email resent',
          snackPosition: SnackPosition.BOTTOM,
        );
      } catch (e) {
        Get.snackbar(
          'Error',
          'Failed to resend verification email',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  void startEmailVerificationCheck() {
    _verificationCheckTimer?.cancel(); // Cancel existing timer if any
    _verificationCheckTimer = Timer.periodic(
      const Duration(seconds: 3), // Check every 3 seconds
      (timer) async {
        final user = auth.currentUser;
        if (user != null) {
          await user.reload(); // Refresh user data
          if (user.emailVerified) {
            timer.cancel();
            // Navigate to the home screen only if the email is verified
            Get.offAllNamed(AppRoutes.HOME);
          }
        }
      },
    );
  }

  @override
  void onClose() {
    _resendTimer?.cancel();
    _verificationCheckTimer?.cancel();
    super.onClose();
  }
}
