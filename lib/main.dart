import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todoapp/authentication/onboarding.dart';
import 'package:todoapp/firebase_options.dart';
import 'package:todoapp/myapp.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  // initilize flutter splash initialize ..
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // when want to stay in splash screen ..
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
// firebase initialize and check user ..
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (value) {
      Get.put(Onboarding());
    },
  );

  // for always portrait size .
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}
