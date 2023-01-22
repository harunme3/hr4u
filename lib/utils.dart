import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void showSnackBar(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(message),
        ),
      );

  static void showTopSnackBar(String message) {
    Get.snackbar(
      'Oops!',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: const Color(0xFFC20000),
      colorText: Colors.white,
    );
  }
}
