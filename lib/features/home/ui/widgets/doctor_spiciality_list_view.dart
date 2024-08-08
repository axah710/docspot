import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/svg_displayer.dart';

class DoctorSpicialityListView extends StatelessWidget {
  const DoctorSpicialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // SizedBox: A widget that forces a child to have a specific size.
      height: 100.h,
      // Here,it's setting a fixed height of 100.h units, adapted to the
      // screen size using flutter_screenutil.
      child: ListView.builder(
        // ListView.builder: A constructor that creates a scrollable list of
        // widgets. It's efficient for large lists because it builds only the
        // widgets visible on the screen.
        scrollDirection: Axis.horizontal,
        // scrollDirection: Axis.horizontal: Specifies the scroll direction
        // as horizontal.
        itemCount: 7,
        // itemCount: 7: The number of items to display in the list.
        itemBuilder: (context, index) {
          // itemBuilder: A callback function that provides the widgets for
          // each item in the list. It takes context and index as arguments.
          return Padding(
            padding: EdgeInsetsDirectional.only(
              start: index == 0 ? 0.w : 24.w,
            ),
            // Padding: Adds space around a widget. Here, it uses
            // EdgeInsetsDirectional.only to conditionally apply padding based
            // on the item's index. For the first item (index == 0), there is
            // no start padding, while subsequent items have a start padding of
            // 24.w units.
            child: Column(
              children: [
                CircleAvatar(
                  // CircleAvatar: A widget that displays a circular image or
                  // icon. Here, it's used to display a circular background with
                  // an SVG image inside.
                  radius: 28.r,
                  backgroundColor: DocSpotColorsManager.lightBlue,
                  child: SvgDisplayer(
                    assetName: "assets/svgs/general_speciality.svg",
                    height: 42.h,
                    width: 42.w,
                  ),
                ),
                verticalSpace(8),
                Text(
                  'General',
                  style: DocSpotTextStyles.font12DarkBlueRegular,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
