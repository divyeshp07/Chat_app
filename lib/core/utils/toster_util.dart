import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';

final class TosterUtil {
  static void showMessage(BuildContext context, String? message) {
    if (message == null) {
      return;
    }

    DelightToastBar(
      position: DelightSnackbarPosition.top,
      autoDismiss: true,
      builder: (context) => ToastCard(
        leading: const Icon(
          Icons.flutter_dash,
          size: 28,
        ),
        title: Text(
          message,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    ).show(context);
  }
}
