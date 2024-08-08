import 'package:docspot/core/theming/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // This widget expands to fill the available space along the main axis
      // (horizontal or vertical) within its parent widget. It allows the
      // ListView.builder to take up the remaining space after other widgets
      // have been laid out.
      child: ListView.builder(
        // A ListView constructor that builds children on demand. This is useful
        // for long lists where the number of children might not be known or is dynamic.
        itemCount: 7,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(
              bottom: 16.h,
            ),
            child: Row(
              children: [
                ClipRRect(
                  // Clips its child using a rounded rectangle. The borderRadius
                  // parameter sets the corner radius, making the image have
                  // rounded corners.
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    width: 110.w,
                    height: 120.h,
                    "assets/images/general_doctor.png",
                    fit: BoxFit.cover,
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  // Expands the child widget to fill the available space along
                  // the main axis, allowing the text column to take up as much
                  // space as needed.
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: DocSpotTextStyles.font18DarkBlueBold,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      verticalSpace(5),
                      Text(
                        'Degree',
                        style: DocSpotTextStyles.font12GrayMedium,
                      ),
                      verticalSpace(5),
                      Text(
                        'Email',
                        style: DocSpotTextStyles.font12GrayMedium,
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
