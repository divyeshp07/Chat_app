import 'package:flutter/material.dart';

extension AppSize on BuildContext {
  double width(double width) {
    return MediaQuery.sizeOf(this).width * width;
  }

  double height(double height) {
    return MediaQuery.sizeOf(this).height * height;
  }
}
