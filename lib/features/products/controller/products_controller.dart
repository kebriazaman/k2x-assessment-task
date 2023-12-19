import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k2x_assessment_task/features/products/model/products_model.dart';

import '../../../utils/utils.dart';

class ProductsController extends GetxController {
  final isLoading = false.obs;

  List<ProductsModel> products = <ProductsModel>[];

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> fetchProducts() async {
    isLoading.value = true;
    try {
      final QuerySnapshot snapshot = await firestore.collection('Products').get();

      if (snapshot.docs.isNotEmpty) {
        products.assignAll(snapshot.docs
            .map(
              (doc) => ProductsModel.fromJson(doc.data() as Map<String, dynamic>, doc.id),
            )
            .toList());
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future<void> addProductsToUser(String productId) async {
    CollectionReference reference = firestore.collection('Products');
    User? user = _auth.currentUser;
    if (user != null) {
      firestore
          .collection('Users')
          .doc(user.uid)
          .collection('products')
          .doc(productId)
          .set({'addedAt': FieldValue.serverTimestamp()}).then((value) {
        Utils.showSnakeBar('Item Added', 'Item has been successfully added to user', Icons.add);
      }).onError((error, stackTrace) {
        Utils.showSnakeBar('Error', 'There is something error.', Icons.error);
      });
    }
  }
}
