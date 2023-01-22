import 'package:flutter/material.dart';

class ToastData {
  static showToast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: 1500),
    ));
  }
}
