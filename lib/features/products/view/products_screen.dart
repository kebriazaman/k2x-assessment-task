import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k2x_assessment_task/assets/image_assets.dart';
import 'package:k2x_assessment_task/common/constants.dart';
import 'package:k2x_assessment_task/features/products/controller/products_controller.dart';
import 'package:k2x_assessment_task/features/products/view/widgets/product_item.dart';
import 'package:k2x_assessment_task/res/app_colors/app_colors.dart';

import '../../../common/text_style.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsController controller = Get.put(ProductsController());
    return Scaffold(
      appBar: AppBar(
        leading: ClipOval(
          child: SizedBox(
            width: 30,
            height: 30,
            child: Image.asset(ImageAssets.user),
          ),
        ),
        title: Image.asset(ImageAssets.sestra),
        actions: const [
          Icon(Icons.add_alert, color: AppColors.lightBlueColor),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Icon(Icons.message, color: AppColors.lightBlueColor),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: kSearchTextFormFieldDecoration.copyWith(
                  fillColor: Colors.grey.shade100,
                  hintStyle: kTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Text('Recommended Products', style: kTextStyle.copyWith(fontSize: 14.0, color: AppColors.blackColor)),
              SizedBox(height: Get.height * 0.01),
              Expanded(
                child: Obx(
                  () => controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          itemCount: controller.products.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                              childAspectRatio: Get.width / (Get.height / 1.6)),
                          itemBuilder: (context, index) {
                            String productID = controller.products[index].id.toString();
                            print(controller.firestore.collection('Products').doc());
                            return ProductItem(
                              url: controller.products[index].url.toString(),
                              description: controller.products[index].description.toString(),
                              price: controller.products[index].price!,
                              onTap: () {
                                controller.addProductsToUser(productID);
                              },
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
