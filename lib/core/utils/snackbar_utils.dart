import 'package:flutter/material.dart';

final class SnackbarUtils {
  static void showMessage(BuildContext context, String? message) {
    if (message == null) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    ));
  }
}
