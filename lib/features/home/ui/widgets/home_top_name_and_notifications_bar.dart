import 'package:docspot/core/theming/app_colors.dart';
import 'package:docspot/core/theming/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/svg_displayer.dart';

class HomeTopNameAndNotificationsBar extends StatelessWidget {
  const HomeTopNameAndNotificationsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // The Column will be at the start, and the CircleAvatar will be at the
      // end, with space between them.
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Ahmed",
              style: DocSpotTextStyles.font18DarkBlueBold,
            ),
            Text(
              "How are you today ?",
              style: DocSpotTextStyles.font12GrayRegular,
            ),
          ],
        ),
        const Spacer(),
        // This ensures that the space between the Column and CircleAvatar is
        // flexible and takes up all the remaining space.
        CircleAvatar(
          radius: 24.r,
          backgroundColor: DocSpotColorsManager.moreLighterGray,
          child: const SvgDisplayer(
            assetName: "assets/svgs/notifications.svg",
          ),
        ),
      ],
    );
  }
}
