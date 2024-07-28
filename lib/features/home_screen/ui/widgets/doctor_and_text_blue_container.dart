import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_fonts.dart';

class DoctorAndTextBlueContainer extends StatelessWidget {
  const DoctorAndTextBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // To add a space that the doctor image can expand in it ...
      height: 195.h,
      child: Stack(
        // Uses a Stack widget to allow layering of children widgets.
        alignment: Alignment.bottomCenter,
        // Aligns the children of the stack to the bottom center.
        children: [
          Container(
            width: double.infinity,
            // Sets the container's width to fill its parent.
            height: 165.h,
            // Less height than the sizedbox to add a space that the doctor
            // image can expand in it ...
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0.r),
              image: const DecorationImage(
                // Adds a background image to the container.
                image: AssetImage('assets/images/home_blue_pattern.png'),
                fit: BoxFit.cover,
                // Ensures the image covers the container.
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book and\nschedule with\nnearest doctor',
                  style: DocSpotTextStyles.font18WhiteMedium,
                  textAlign: TextAlign.start,
                  // Aligns text to the start.
                ),
                verticalSpace(16),
                Expanded(
                  // Expands the button to fill available space.
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48.0.r),
                      ),
                    ),
                    child: Text(
                      'Find Nearby',
                      style: DocSpotTextStyles.font12BlueRegular,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            // Positions a widget relative to its parent stack.
            right: 8.w,
            top: 0.h,
            child: Image.asset(
              'assets/images/female_doctor.png',
              height: 200.h,
            ),
          ),
        ],
      ),
    );
  }
}
