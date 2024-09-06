import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
//! In shimmer loading, we use the same widget to simulate the same appearance,
//! but we need to replace the child with the shimmer effect.
//! That's the main concept.
class SpecialityShimmerLoading extends StatelessWidget {
  const SpecialityShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor: DocSpotColorsManager.lightGray,
                  highlightColor: Colors.white,
                  child:  CircleAvatar(
                    radius: 28.r,
                    backgroundColor: Colors.white,
                  ),
                ),
                verticalSpace(14),
                Shimmer.fromColors(
                  baseColor: DocSpotColorsManager.lightGray,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 14.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: DocSpotColorsManager.lightGray,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}