import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/utilities/model/user_model.dart';
import 'package:todoapp/view_data/view_task_page.dart';

class SignupControler extends GetxController {
  // create instance ..
  static SignupControler get instance => Get.find();

  // firebase variables ..
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  // textEditing Controler ..

  final fullname = TextEditingController();
  final phone = TextEditingController();
  final username = TextEditingController();
  final country = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
 // Rxbool ..
  RxBool isShow = true.obs;
  RxBool isagree = true.obs;

  //signup with email and password ..
  Future<void> createAccount() async {
    try {
      if (email.text.isNotEmpty && password.text.isNotEmpty) {
        _auth
            .createUserWithEmailAndPassword(
                email: email.text, password: password.text)
            .then((value) {
          Get.snackbar('SignUp SuccessFull', '',
              backgroundColor: Colors.blue.withOpacity(0.5),
              colorText: Colors.white,
              duration: const Duration(seconds: 2),
              snackPosition: SnackPosition.BOTTOM);

          // delay for authenticate and  navigate to Home Page ..
          Future.delayed(
              const Duration(
                seconds: 2,
              ),
              () => Get.to(() => const ViewTask()));
          //clear field ..
          fullname.clear();
          phone.clear();
          country.clear();
          email.clear();
          password.clear();
        });
      } else {
        Get.snackbar('SignUp Failed', '',
            backgroundColor: Colors.blue.withOpacity(0.5),
            colorText: Colors.white,
            duration: const Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (error) {
      debugPrint('$error');
    }
  }

// Upload user data on firebase firestore ..
  Future<void> uploadData(UserModel user) async {
    final document = _firestore.collection('User').doc();
    user.id = document.id;

    document.set(user.tomap()).then(
      (value) {
        debugPrint('User Upload Successfull');
      },
    ).onError(
      (error, stackTrace) {
        debugPrint('User Upload Successfull .. $error');
      },
    );
  }
 }
