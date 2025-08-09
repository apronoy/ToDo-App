import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/utilities/constants/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo app',
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          textTheme: GoogleFonts.nunitoTextTheme(ThemeData.light().textTheme)
              .apply(
                  fontFamily: 'Nunito',
                  displayColor: Pcolors.black,
                  bodyColor: Pcolors.black)),
      darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          textTheme: GoogleFonts.nunitoTextTheme(ThemeData.dark().textTheme)
              .apply(
                  fontFamily: 'Nunito',
                  displayColor: Pcolors.white,
                  bodyColor: Pcolors.white)),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: const Scaffold(
        backgroundColor: Pcolors.blue,
        body: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
