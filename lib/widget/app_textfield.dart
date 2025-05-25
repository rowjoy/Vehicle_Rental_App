
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewCustomTextField extends StatelessWidget {
  final String? level;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final Key? fromkey;
  final String? hintText;
  final VoidCallback? onTap;
  final Function(dynamic)? onChanged;
  final FocusNode? focusNode;
  final bool readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final bool? autofocus;
  final Iterable<String>? autofillHints;
  final Function(String)? onFieldSubmitted;
  final int? minLines;
  final int? maxLines;
  const NewCustomTextField({
    Key? key, this.keyboardType,
    this.level, 
    this.obscureText =  false, 
    this.suffixIcon, 
    this.controller,
    this.prefixIcon,
    this.fromkey,
    this.validator,
    this.autovalidateMode,
    this.inputFormatters,
    this.hintText,
    this.onTap,
    this.focusNode,
    this.readOnly = false,
    this.contentPadding,
    this.onChanged,
    this.autofocus,
    this.autofillHints,
    this.onFieldSubmitted,
    this.minLines,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      child: TextFormField(
         style: NecMoneyAppText.inputTextStyle(),
        autofocus: autofocus ?? false,
        key: fromkey,
        minLines: minLines ?? 1,
        maxLines: maxLines ?? 1,
        validator: validator,
        readOnly: readOnly,
        onChanged: onChanged,
        // textInputAction: TextInputAction.next,
        autovalidateMode: autovalidateMode,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        onTap: onTap,
        focusNode: focusNode,
        autofillHints:autofillHints,
        onFieldSubmitted:onFieldSubmitted,
        decoration: InputDecoration(
          contentPadding: contentPadding ?? EdgeInsets.all(15),
          hintText: hintText,
          isDense: true,
          filled: true,
          suffixIcon: suffixIcon,
          prefixIcon:prefixIcon,
          fillColor: AppColor.kWhiteColor,
          label:  level != null ? Text(level!, style: AppFontStyle.levelTextNormal()):Text(''),
          errorStyle: NecMoneyAppText.errorTextStyle(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.kGreenColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.textfieldStock),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.kSecondaryColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.kGreenColor),
          ),
        ),
      ),
    );
  }
}