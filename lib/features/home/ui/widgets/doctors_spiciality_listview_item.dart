// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/svg_displayer.dart';
import '../../data/models/specializations_response_model.dart';

class DoctorsSpicialityListViewItem extends StatelessWidget {
  final SpecializationsData? specializationsResponseModelDataList;

  final int itemIndex;
  // Used to specify the padding

  const DoctorsSpicialityListViewItem({
    super.key,
    required this.specializationsResponseModelDataList,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: itemIndex == 0 ? 0.w : 24.w,
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
            specializationsResponseModelDataList?.name ?? "General",
            style: DocSpotTextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
