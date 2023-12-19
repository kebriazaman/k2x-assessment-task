import 'package:flutter/material.dart';

import '../../../../common/text_style.dart';
import '../../../../res/app_colors/app_colors.dart';

class ProductItem extends StatelessWidget {
  ProductItem({
    required this.url,
    required this.description,
    required this.price,
    required this.onTap,
    super.key,
  });

  String url, description;
  int price;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColor.withOpacity(0.2)),
          boxShadow: [BoxShadow(color: AppColors.greyColor.withOpacity(0.02), spreadRadius: 1.0)],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.network(url),
                  Positioned(
                      left: 120.0,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                            color: AppColors.greyColor.withOpacity(0.1),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.favorite, size: 16.0),
                          ))),
                ],
              ),
              Text(
                description,
                style: kTextStyle.copyWith(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor),
              ),
              Expanded(
                child: Text(
                  'Rs. $price',
                  style: kTextStyle.copyWith(fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
