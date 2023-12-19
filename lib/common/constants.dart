import 'package:flutter/material.dart';

import '../res/app_colors/app_colors.dart';

const kLoginInputFieldDecoration = InputDecoration(
  prefixIcon: Icon(Icons.person, size: 24, color: AppColors.greyColor),
  hintText: 'Email Address',
  hintStyle: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: Color(0xFFAAB1B1),
  ),
  border: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.greyColor)),
  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.greyColor)),
  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.greyColor)),
);

const kSearchTextFormFieldDecoration = InputDecoration(
  filled: true,
  prefixIcon: Icon(
    Icons.search,
    color: AppColors.greyColor,
    size: 19,
  ),
  contentPadding: EdgeInsets.zero,
  hintText: 'Search',
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyColor), borderRadius: BorderRadius.all(Radius.circular(8.0))),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyColor), borderRadius: BorderRadius.all(Radius.circular(8.0))),
  border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyColor), borderRadius: BorderRadius.all(Radius.circular(8.0))),
);
