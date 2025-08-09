import 'package:flutter/material.dart';

class Phelperfuction {
  static bool isdark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
