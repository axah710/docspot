import 'package:docspot/core/theming/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/svgs/docspot_logo.svg",
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          "DocSpot",
          style: AppTextStyles.font24BlackBold,
        ),
      ],
    );
  }
}
