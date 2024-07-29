import 'package:flutter/material.dart';

import '../../../../core/theming/app_fonts.dart';

class DoctorSpecialitySeeAll extends StatelessWidget {
  const DoctorSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Doctor Speciality",
          style: DocSpotTextStyles.font18DarkBlueSemiBold,
        ),
        Text(
          "See All",
          style: DocSpotTextStyles.font12BlueRegular,
        ),
      ],
    );
  }
}
