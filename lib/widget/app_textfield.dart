import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String?)? onSaved;
  final String? hintTextValue;
  final Function()? onTapsuffixIcon;
  final Widget? iconsuffixIcon;
  final bool? obscureText;
  const CustomTextField({
    super.key,
   required this.controller,
   required this.keyboardType,
   required this.hintTextValue,
   required this.onSaved,
   this.onTapsuffixIcon,
   required this.iconsuffixIcon,
   this.obscureText = false,

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      controller: controller,
      obscureText: obscureText!,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintTextValue!,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFF3F2F2)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFF3F2F2)),
        ),
        suffixIcon: GestureDetector(
        onTap: onTapsuffixIcon,
        child: iconsuffixIcon,
       ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your ${hintTextValue!.toLowerCase()}';
        }
        return null;
      },
    );
  }
}