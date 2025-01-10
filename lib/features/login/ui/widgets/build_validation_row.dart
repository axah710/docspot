import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildValidationRow(String text, bool hasValidated) {
  // This function returns a Row widget that represents a single validation
  // criterion.
  return Row(
    children: [
      CircleAvatar(
        radius: 2.5.r,
        backgroundColor: DocSpotColorsManager.gray,
      ),
      //  A circular indicator showing the validation state.
      horizontalSpace(6),
      Text(
        text,
        style: DocSpotTextStyles.font13DarkBlueRegular.copyWith(
          decoration:
              hasValidated ? TextDecoration.lineThrough : TextDecoration.none,
          decorationColor: DocSpotColorsManager.green.withOpacity(0.77),
          //  Set to green if validated.
          decorationThickness: 2,
          color: hasValidated
              ? DocSpotColorsManager.gray
              : DocSpotColorsManager.darkBlue,
          // Gray if validated, dark blue otherwise.
        ),
      ),
    ],
  );
}
