import '../theming/app_colors.dart';
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
      // Expanded: This widget expands a child of a Row, Column, or Flex so that
      // the child fills the available space.
      child: Divider(
        // Divider: This is a built-in Flutter widget that creates a horizontal
        // line to separate content.
        endIndent: endIndent ?? 9.w,
        // endIndent: endIndent ?? 9.w: Sets the space at the end of the divider.
        // If endIndent is not provided, it defaults to 9.w
        //(responsive width unit from flutter_screenutil).
        indent: indent ?? 9.w,
        // indent: indent ?? 9.w: Sets the space at the start of the divider.
        //If indent is not provided, it defaults to 9.w.
        height: height ?? 1.h,
        // height: height ?? 1.h: Sets the height of the divider. If height is
        // not provided, it defaults to 1.h (responsive height unit).
        color: color ?? DocSpotColorsManager.greyLight,
        // color: color ?? DocSpotColorsManager.greyLight: Sets the color of the
        //divider. If color is not provided, it defaults to
        //DocSpotColorsManager.greyLight, which is presumably defined in the
        // app_colors.dart file.
      ),
    );
  }
}
// The BuildDivider widget is a customizable divider that can be used within a 
//layout to separate content. It uses responsive design units to adapt to 
//different screen sizes and provides default values for its properties if they
// are not specified.
