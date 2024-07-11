import 'package:docspot/core/helpers/spacing.dart';
import 'package:docspot/core/theming/app_colors.dart';
import 'package:docspot/core/theming/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowercaseLetter;
  final bool hasUppercaseLetter;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinimumLength;
  const PasswordValidations({
    super.key,
    required this.hasLowercaseLetter,
    required this.hasUppercaseLetter,
    required this.hasNumber,
    required this.hasSpecialCharacter,
    required this.hasMinimumLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(
          "At least one lowercase letter",
          hasLowercaseLetter,
        ),
        verticalSpace(2),
        buildValidationRow(
          "At least one uppercase letter",
          hasUppercaseLetter,
        ),
        verticalSpace(2),
        buildValidationRow(
          "At least one number",
          hasNumber,
        ),
        verticalSpace(2),
        buildValidationRow(
          "At least one special character",
          hasSpecialCharacter,
        ),
        verticalSpace(2),
        buildValidationRow(
          "At least 8 characters",
          hasMinimumLength,
        ),
      ],
    );
  }
}

Widget buildValidationRow(String text, bool hasValidated) {
  return Row(
    children: [
      CircleAvatar(
        radius: 2.5.r,
        backgroundColor: DocSpotColorsManager.gray,
      ),
      horizontalSpace(6),
      Text(
        text,
        style: DocSpotTextStyles.font13DarkBlueRegular.copyWith(
          decoration:
              hasValidated ? TextDecoration.lineThrough : TextDecoration.none,
          decorationColor: DocSpotColorsManager.green,
          decorationThickness: 2,
          color: hasValidated
              ? DocSpotColorsManager.gray
              : DocSpotColorsManager.darkBlue,
        ),
      ),
    ],
  );
}
