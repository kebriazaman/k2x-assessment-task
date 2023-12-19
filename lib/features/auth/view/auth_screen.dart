import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k2x_assessment_task/common/text_style.dart';
import 'package:k2x_assessment_task/features/auth/controller/auth_controller.dart';
import 'package:k2x_assessment_task/features/auth/view/widgets/login_rounded_button.dart';
import 'package:k2x_assessment_task/features/auth/view/widgets/login_social_button.dart';
import 'package:k2x_assessment_task/features/auth/view/widgets/login_textform_field.dart';
import 'package:k2x_assessment_task/res/app_colors/app_colors.dart';

import '../../../assets/image_assets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(ImageAssets.logo, width: 164, height: 157),
                  Text('Welcome', style: kTextStyle.copyWith(color: AppColors.blackColor)),
                  Text('Login to your account', style: kTextStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 14)),
                  SizedBox(height: Get.height * 0.02),
                  LoginTextFormField(controller: controller.email, text: 'Email', hintText: 'Email Address'),
                  SizedBox(height: Get.height * 0.01),
                  LoginTextFormField(controller: controller.password, text: 'Password', hintText: 'Password'),
                  SizedBox(height: Get.height * 0.01),
                  Text(
                    textAlign: TextAlign.right,
                    'Forgot Password?',
                    style: kTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Obx(
                    () => LoginRoundedButton(
                        title: 'Login',
                        onPress: () {
                          controller.userSignIn();
                        },
                        isLoading: controller.isLoading.value),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'or connect with',
                          style: kTextStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginSocialButton(image: ImageAssets.facebookLogo, onTap: () {}),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: LoginSocialButton(
                              image: ImageAssets.googleLogo,
                              onTap: () {
                                controller.googleSignIn();
                              })),
                      LoginSocialButton(image: ImageAssets.appleLogo, onTap: () {}),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: kTextStyle.copyWith(
                            fontSize: 16.0, fontWeight: FontWeight.w400, color: AppColors.blackColor),
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        'Sign up',
                        style: kTextStyle.copyWith(
                            fontSize: 16.0, fontWeight: FontWeight.w400, color: AppColors.lightBlueColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
