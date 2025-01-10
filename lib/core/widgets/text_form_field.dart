import '../theming/app_colors.dart';
import '../theming/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocSpotTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  // Padding inside the text field.
  final InputBorder? focusedBorder;
  //  Border style when the text field is focused.
  final TextStyle? inputStyle;
  // Text style for the input text.
  final TextStyle? hintStyle;
  // Text style for the hint text.
  final bool? isObscureText;
  // Whether the text field should obscure the text (useful for passwords).
  final String hintText;
  // Text style for the hint text.
  //  The hint text displayed when the text field is empty.
  final Widget? suffixIcon;
  // An optional widget to display at the end of the text field.
  final Color? fillColor;
  // Background color of the text field.
  final TextEditingController? controller;
  // final Function(String?) validator;
  final Function(String?) validator;
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
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // controller manages the text being edited.

      validator: (value) {
        return validator(value);
        // validator is a function that checks if the text input is valid and
        // returns an error message if it isn't.
      },

      decoration: InputDecoration(
        // The InputDecoration object customizes the appearance of the TextFormField
        isDense: true,
        // isDense: true: Reduces the height of the text field.
        contentPadding: contentPadding ??
            // contentPadding: Uses the provided contentPadding or defaults to
            // horizontal and vertical padding values.
            EdgeInsets.symmetric(
              horizontal: 23.0.w,
              vertical: 16.0.h,
            ),
        focusedBorder: focusedBorder ??
            // focusedBorder: Uses the provided focusedBorder or defaults to an
            //OutlineInputBorder with a specific color and width.
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
          // enabledBorder: Defines the border when the text field is not focused,
          // using a lighter gray color.
          borderRadius: BorderRadius.circular(
            16.r,
          ),
          borderSide: BorderSide(
            color: DocSpotColorsManager.lighterGray,
            width: 1.3.w,
          ),
        ),
        hintStyle: hintStyle ?? DocSpotTextStyles.font14LightGrayRegular,
        // hintStyle: Uses the provided hintStyle or defaults to a predefined text style.
        hintText: hintText,
        // hintText: Displays the provided hint text.
        suffixIcon: suffixIcon,
        // suffixIcon: Displays the provided suffix icon, if any.

        fillColor: fillColor ?? DocSpotColorsManager.moreLightGray,
        // fillColor: Uses the provided fillColor or defaults to a light gray color.
        filled: true,
        // filled: true: Ensures the text field is filled with the background color.
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            16.r,
          ),
          borderSide: BorderSide(
            color: DocSpotColorsManager.red,
            width: 1.3.w,
          ),
        ),
        // errorBorder set the border styles when there is a validation error.
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            16.r,
          ),
          borderSide: BorderSide(
            color: DocSpotColorsManager.red,
            width: 1.3.w,
          ),
        ),
        // focusedErrorBorder set the border styles when there is a validation
        // error.
      ),
      cursorColor: DocSpotColorsManager.primaryBlueColor,
      // cursorColor: Sets the color of the cursor to the primary blue color.
      obscureText: isObscureText ?? false,
      // obscureText: Uses the provided isObscureText value or defaults to false.
      style: inputStyle ?? DocSpotTextStyles.font14DarkBlueMedium,
      // style: Uses the provided inputStyle or defaults to a predefined text style.
    );
  }
}
// DocSpotTextFormField, which is a specialized text input field for a Flutter
// application. This widget is designed to be reusable and customizable,
//with several properties that allow for flexible styling and behavior.
