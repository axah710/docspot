import '../../../../core/helpers/extinsions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          DocSpotColorsManager.primaryBlueColor,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        // This property is used to define the size of the tap target for the
        //button. MaterialTapTargetSize.shrinkWrap makes the tap target size as
        //small as possible while still being accessible.
        minimumSize: WidgetStateProperty.all<Size>(
          Size(
            double.infinity,
            52.h,
          ),
          // This property sets the minimum size of the button.
          // Size(double.infinity, 52.h) specifies that the button should take
          // up the full available width (double.infinity) and have a height of
          //52.h. The 52.h likely uses the flutter_screenutil package to adapt
          //the height based on the screen size, ensuring responsive design.
        ),
      ),
      onPressed: () {
        context.pushNamed(
          Routes.loginScreen,
        );
      },
      child: Text(
        "Get Started",
        style: DocSpotTextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
