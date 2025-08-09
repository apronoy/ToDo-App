import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/model/model.dart';

class ProductdataControler extends GetxController {
  // create instance .. 
  static ProductdataControler get instance => Get.find();

    //textfield texteditingcontroler variables ...
  final id = TextEditingController();
  final name = TextEditingController();
  final price = TextEditingController();

  //firebase firestore instance .. 
  final _firestore = FirebaseFirestore.instance;

  //Product post data of firestore ..
   Future<void> postUser(ProductModel product) async {
    final document = _firestore.collection('Products').doc();
    product.id = document.id;

    document.set(product.toMap()).then(
      (value) {
        debugPrint('Product Upload Successfully ');
        Get.snackbar('Upload SuccessFull', '',
            backgroundColor: Colors.blue.withOpacity(0.5),
            colorText: Colors.white,
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM);
      },
    ).onError(
      (error, stackTrace) {
        debugPrint('Product added failed $error');
        Get.snackbar('Upload Failed', '$error',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM);
      },
    );
  }

// get data from firestore ..
   Future<List<ProductModel>> getData() async {
    final products = await _firestore.collection('Products').get();

    List<ProductModel> allData = products.docs
        .map((productData) => ProductModel.toModel(productData.data()))
        .toList();
    return allData;
  }

  //update data using  user interface ...
   Future<void> updateData(String id, Map<String, dynamic> data) async {
    await _firestore.collection('Products').doc(id).update(data).then((value) {
      Get.snackbar('Upload SuccessFull', '',
          backgroundColor: Colors.blue.withOpacity(0.5),
          colorText: Colors.white,
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
    }).onError(
      (error, stackTrace) {
        Get.snackbar('Upload failed', '',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM);
      },
    );
  }

  // delete data from user interface ..
  Future<void> deleteData(String id) async {
    _firestore.collection('Products').doc(id).delete().then((value) {
      Get.snackbar('Delete SuccessFull', '',
          backgroundColor: Colors.blue.withOpacity(0.5),
          colorText: Colors.white,
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
    }).onError(
      (error, stackTrace) {
        Get.snackbar('Delete failed', '',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM);
      },
    );
  }

}
