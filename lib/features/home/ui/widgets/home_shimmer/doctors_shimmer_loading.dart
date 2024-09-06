import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
//! In shimmer loading, we use the same widget to simulate the same appearance,
//! but we need to replace the child with the shimmer effect.
//! That's the main concept.
class DoctorsShimmerLoading extends StatelessWidget {
  const DoctorsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                Shimmer.fromColors(
                  baseColor: DocSpotColorsManager.lightGray,
                  highlightColor: Colors.white,
                  child: Container(
                    width: 110.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0.r),
                      color: Colors.white,
                    ),
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: DocSpotColorsManager.lightGray,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 18.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            color: DocSpotColorsManager.lightGray,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      ),
                      verticalSpace(12),
                      Shimmer.fromColors(
                        baseColor: DocSpotColorsManager.lightGray,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 14.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            color: DocSpotColorsManager.lightGray,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      ),
                      verticalSpace(12),
                      Shimmer.fromColors(
                        baseColor: DocSpotColorsManager.lightGray,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 14.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            color: DocSpotColorsManager.lightGray,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      ),
                    ],
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