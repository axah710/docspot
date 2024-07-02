import 'package:docspot/core/theming/app_fonts.dart';
import 'package:docspot/core/widgets/svg_displayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocImageAndText extends StatelessWidget {
  const DocImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SvgDisplayer(
          assetName: "assets/svgs/docspot_logo_low_opacity.svg",
        ),
      
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [
                0.14,
                0.4,
              ],
              // stops: const [0.14, 0.4]: These are the positions where the
              // gradient colors are placed. 0.14 means 14% from the start, and
              // 0.4 means 40% from the start.
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
                // The gradient transitions from opaque white to fully
                // transparent white.
              ],
            ),
          ),
          child: Image.asset(
            "assets/images/onboarding_doctor.png",
          ),
        ),
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 30.0,
          child: Text(
            "Best Doctor\nAppointment App",
            textAlign: TextAlign.center,
            style: DocSpotTextStyles.font32BlueBold.copyWith(
              height: 1.1.h,
            ),
          ),
        ),
      ],
    );
  }
}
