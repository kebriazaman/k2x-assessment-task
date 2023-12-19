import 'package:flutter/material.dart';

import '../../../../common/text_style.dart';
import '../../../../res/app_colors/app_colors.dart';

class LoginRoundedButton extends StatelessWidget {
  LoginRoundedButton({
    required this.title,
    required this.onPress,
    required this.isLoading,
    super.key,
  });

  String title;
  VoidCallback onPress;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.lightBlueColor,
      ),
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Text(
              title,
              style: kTextStyle.copyWith(fontSize: 16.0, color: AppColors.whiteColor),
            ),
    );
  }
}
