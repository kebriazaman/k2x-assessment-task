import 'package:flutter/material.dart';

import '../../../../res/app_colors/app_colors.dart';

class LoginSocialButton extends StatelessWidget {
  LoginSocialButton({
    required this.image,
    required this.onTap,
    super.key,
  });

  String image;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: AppColors.whiteColor,
      splashColor: AppColors.whiteColor,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColor),
          borderRadius: const BorderRadius.all(Radius.circular(32.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(image),
        ),
      ),
    );
  }
}
