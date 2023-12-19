import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:k2x_assessment_task/data/repository/auth_repository.dart';

import '../../../utils/utils.dart';
import '../../products/view/products_screen.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthRepository authRepository = AuthRepository();

  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> userSignIn() async {
    try {
      isLoading.value = true;
      await authRepository.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      Get.to(() => const ProductsScreen());
      Utils.showSnakeBar('Sign In', 'User Successfully Signed In', Icons.person);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  Future<void> googleSignIn() async {
    try {
      authRepository.signInWithGoogle().then((value) {
        Get.to(() => const ProductsScreen());
        Utils.showSnakeBar('Sign In', 'User Successfully Signed In', Icons.person);
      });
    } catch (e) {
      Utils.showSnakeBar('Error', e.toString(), Icons.error);
    }
  }

  Future<void> userLogout() async {
    await GoogleSignIn().signOut();
  }
}
