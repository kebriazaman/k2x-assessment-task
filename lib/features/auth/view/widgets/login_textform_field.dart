import 'package:flutter/material.dart';

import '../../../../common/constants.dart';
import '../../../../common/text_style.dart';

class LoginTextFormField extends StatelessWidget {
  LoginTextFormField({
    required this.controller,
    required this.text,
    required this.hintText,
    super.key,
  });

  String text, hintText;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: Text(text, style: kTextStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 14)),
        ),
        TextFormField(
          controller: controller,
          decoration: kLoginInputFieldDecoration.copyWith(hintText: hintText),
        ),
      ],
    );
  }
}
