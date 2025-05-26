import 'package:flutter/material.dart';
import 'package:vehicle_rental_app/core/utils/colors.dart';

class AppTextStyle {
  static TextStyle inputTextStyle() => TextStyle(
        color: AppColor.themeBlackColor,
        fontSize: 12,
        fontWeight: FontWeight.normal,
  );
  static TextStyle errorTextStyle() => TextStyle(
        color: AppColor.themeErrorColor,
        fontSize: 15,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.3,
  );

  static appButtonTextStyle() => TextStyle(
        color: AppColor.themeWhiteColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
  );
}