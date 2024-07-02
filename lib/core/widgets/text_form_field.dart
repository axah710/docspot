import 'package:docspot/core/theming/app_colors.dart';
import 'package:docspot/core/theming/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocSpotTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final TextStyle? inputStyle;
  final TextStyle? hintStyle;
  final bool? isObscureText;
  final String hintText;
  final Widget? suffixIcon;
  final Color? fillColor;
  const DocSpotTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.inputStyle,
    this.hintStyle,
    this.isObscureText,
    this.suffixIcon,
    required this.hintText,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 23.0.w,
              vertical: 16.0.h,
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                16.r,
              ),
              borderSide: BorderSide(
                color: DocSpotColorsManager.primaryBlueColor,
                width: 1.3.w,
              ),
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            16.r,
          ),
          borderSide: BorderSide(
            color: DocSpotColorsManager.lighterGray,
            width: 1.3.w,
          ),
        ),
        hintStyle: hintStyle ?? DocSpotTextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: fillColor ?? DocSpotColorsManager.moreLightGray,
        filled: true,
      ),
      cursorColor: DocSpotColorsManager.primaryBlueColor,
      obscureText: isObscureText ?? false,
      style: inputStyle ?? DocSpotTextStyles.font14DarkBlueMedium,
    );
  }
}
