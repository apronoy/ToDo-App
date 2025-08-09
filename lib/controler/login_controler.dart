import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todoapp/authentication/loginPage.dart';
import 'package:todoapp/view_data/view_task_page.dart';

class LoginControler extends GetxController {
  // instance ..
  static LoginControler get instance => Get.find();

  // textfield texteditingControler ..

  final email = TextEditingController();
  final password = TextEditingController();
  final _auth = FirebaseAuth.instance;
  //rxbool variable ..
  RxBool isagree = false.obs;
  RxBool isShow = true.obs;

// login uesr with emaili and password ..
  Future<void> loginUser() async {
    try {
      if (email.text.isNotEmpty && password.text.isNotEmpty) {
        _auth
            .signInWithEmailAndPassword(
                email: email.text.trim(), password: password.text.trim())
            .then((e) async {
          Get.snackbar('Login SuccessFull', '',
              backgroundColor: Colors.blue.withOpacity(0.5),
              colorText: Colors.white,
              duration: const Duration(seconds: 2),
              snackPosition: SnackPosition.BOTTOM);

          // after login navigate main page ...
          Future.delayed(
              const Duration(
                seconds: 2,
              ),
              () => Get.to(() => const ViewTask()));
        }).onError(
          (error, stackTrace) {
            Get.snackbar('$error !!', '$stackTrace',
                backgroundColor: Colors.blue.withOpacity(0.5),
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM);
          },
        );
      } else {
        Get.snackbar('Warning  !!', ' Email and Password is Empty !!!!',
            backgroundColor: Colors.blue.withOpacity(0.5),
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // sign in with google ..
  Future<void> googleSignin() async {
    //  select account or choose google account ..
    final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
    //verification account ..
    final GoogleSignInAuthentication? googleauth =
        await userAccount?.authentication;
    // get cradentials
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleauth!.accessToken,
      idToken: googleauth.idToken,
    );
    //signinwith credentials ..
    await _auth.signInWithCredential(credential).then((value) async {
      Get.snackbar('Login SuccessFull', '',
          backgroundColor: Colors.blue.withOpacity(0.5),
          colorText: Colors.white,
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
      //extra delay on fatch data .. 
      Future.delayed(
          const Duration(
            seconds: 2,
          ),
          () => Get.to(() => const ViewTask()));
     }).onError((error, stackTrace) {
      Get.snackbar(' Ops Login failed ', '$error',
          backgroundColor: Colors.blue.withOpacity(0.5),
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  Future<void> logout() async {
    await _auth.signOut().then(
      (value) {
        Get.offAll(() => const Loginpage());
      },
    ).onError(
      (error, stackTrace) {
        debugPrint('Error !! $error');
      },
    );
  }
}
