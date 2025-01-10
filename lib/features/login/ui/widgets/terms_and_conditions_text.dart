import '../../../../core/theming/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: DocSpotTextStyles.font13GrayRegular,
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: DocSpotTextStyles.font13DarkBlueMedium,
          ),
          TextSpan(
            text: ' and',
            style: DocSpotTextStyles.font13GrayRegular.copyWith(
              height: 1.5.h,
            ),
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: DocSpotTextStyles.font13DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}
