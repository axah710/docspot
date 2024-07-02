import 'package:docspot/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildDivider extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? indent;
  final double? endIndent;

  const BuildDivider({
    super.key,
    this.color,
    this.height,
    this.indent,
    this.endIndent,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        endIndent: endIndent ?? 9.w,
        indent: indent ?? 9.w,
        height: height ?? 1.h,
        color: color ?? DocSpotColorsManager.greyLight,
      ),
    );
  }
}
