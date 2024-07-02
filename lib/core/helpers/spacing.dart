import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox verticalSpace(
  double height,
) {
  return SizedBox(
    height: height.h,
  );
  // This function takes a double value height as an argument.
// It returns a SizedBox widget with its height property set to height.h.
// The .h extension is provided by the flutter_screenutil package,
// which converts the given height to a responsive value based on the screen size.
}

SizedBox horizontalSpace(
  double width,
) {
  return SizedBox(
    width: width.w,
  );
  // This function takes a double value width as an argument.
// It returns a SizedBox widget with its width property set to width.w.
// The .w extension is provided by the flutter_screenutil package, which converts the given width to a responsive value based on the screen size.
}
// verticalSpace and horizontalSpace, which are used to create vertical and
// horizontal spaces, respectively, in a Flutter application.
// These functions utilize the SizedBox widget from Flutter and 
//the flutter_screenutil package to ensure that the spacing is responsive to
// different screen sizes.

// Readability: These utility functions make the code more readable and expressive.
// Responsiveness: By using flutter_screenutil, the spacing adapts to different 
//screen sizes, ensuring a consistent look across various devices.
