import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_fonts.dart';
import '../../../data/models/specializations_response_model.dart';

class DoctorListViewItem extends StatelessWidget {
  final DoctorsModel? doctorDataList;
  // Contains the doctor's data.

  const DoctorListViewItem({super.key, this.doctorDataList});

  @override
  Widget build(BuildContext context) {
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
                  doctorDataList?.name ?? "Gisselle",
                  style: DocSpotTextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                verticalSpace(5),
                Text(
                  "${doctorDataList?.degree} | ${doctorDataList?.phone}",
                  style: DocSpotTextStyles.font12GrayMedium,
                ),
                verticalSpace(5),
                Text(
                  doctorDataList?.email ?? "Zechariah7@hotmail.com",
                  style: DocSpotTextStyles.font12GrayMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
