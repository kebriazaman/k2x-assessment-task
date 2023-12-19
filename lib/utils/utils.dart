import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:k2x_assessment_task/res/app_colors/app_colors.dart';

class Utils {
  Utils._();
  static void showSnakeBar(String title, String content, IconData icon) {
    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: content,
        icon: Icon(icon),
        backgroundColor: AppColors.lightBlueColor,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
