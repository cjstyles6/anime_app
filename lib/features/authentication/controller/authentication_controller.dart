import 'package:anime_app/data/repositories/signup_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anime_app/data/repositories/google_repository.dart';

class AuthenticationController extends GetxController {
  final GoogleRepository _googleRepository;
  final SignupRepository _signupRepository;

  RxBool isAuthenticated = false.obs;

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthenticationController(this._googleRepository, this._signupRepository) {
    ever(_googleRepository.firebaseUser, (user) {
      isAuthenticated.value = user != null;
    });
  }

  Future<void> signInWithGoogle() async {
    await _googleRepository.signInWithGoogle();
  }

  Future<void> signOut() async {
    await _googleRepository.signOutFromGoogle();
  }

  Future<void> signupWithEmailAndPassword(String email, String password) async {
    await _signupRepository.signupWithEmailAndPassword(email, password);
  }
}
