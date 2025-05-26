
// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:vehicle_rental_app/core/utils/colors.dart';

class AppButton extends StatelessWidget {
  final String? buttonLevel;
  final Color?  color;
  final Color? textColor;
  final VoidCallback?  onPressed;
  final double? borderRadius;
  final Widget? btnwidget;
  final FocusNode? focusNode;
  final Function(bool)? onFocusChange;
  const AppButton({
    super.key,  this.buttonLevel, this.btnwidget, this.color, this.onPressed,this.textColor, this.borderRadius, this.focusNode,this.onFocusChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        focusNode: focusNode,
        onFocusChange: onFocusChange,
        child: btnwidget ?? Text(buttonLevel!,
          textAlign: TextAlign.center,
          style: textColor != null ? TextStyle(color: AppColor.themeGreyColor,fontSize: 14,fontWeight: FontWeight.bold)
          : TextStyle(color: AppColor.themeWhiteColor,fontSize: 14,fontWeight: FontWeight.bold),
        ),
        onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius:  BorderRadius.circular(borderRadius ?? 1)
            ),
          ),
        ),
    );
  }
}