import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../widgets/doctor_and_text_blue_stack.dart';
import '../widgets/doctor_speciality_see_all.dart';
import '../widgets/home_top_name_and_notifications_bar.dart';
import '../widgets/setup_speclization_and_doctor_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(
            20.w,
            16.h,
            28.w,
            28.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopNameAndNotificationsBar(),
              const DoctorAndTextBlueStack(),
              verticalSpace(24),
              const DoctorSpecialitySeeAll(),
              verticalSpace(18),
              const SpeclizationAndDoctorBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
