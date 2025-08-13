import 'package:flutter/material.dart';

class CustomSnackBar {
  BuildContext context;
  CustomSnackBar.of(this.context);

  void customSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
