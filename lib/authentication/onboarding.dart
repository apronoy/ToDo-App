import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:todoapp/authentication/loginPage.dart';
import 'package:todoapp/view_data/view_task_page.dart';
 
class Onboarding extends GetxController {
  // instance created..
  static Onboarding get instance => Get.find();

  // firebase stored ..
  final _auth = FirebaseAuth.instance;
  // remove splash screen  and screenredirect ..
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenredirect();
  }

  void screenredirect() {
    final user = _auth.currentUser;
    // check user account is in or not ..
    if (user != null) {
      // check email is verified or not ..
      if (user.emailVerified) {
        Get.offAll(() => const ViewTask ());
      } else {
        Get.offAll(() => const Loginpage());
      }
    } else {
      Get.offAll(() => const Loginpage());
    }
  }
}
