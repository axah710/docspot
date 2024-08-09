import 'package:docspot/features/home/ui/widgets/doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../logic/home_cubit/home_cubit.dart';
import '../../logic/home_cubit/home_state.dart';
import 'doctor_spiciality_list_view.dart';

class SpeclizationAndDoctorBlocBuilder extends StatelessWidget {
  const SpeclizationAndDoctorBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: ((previous, current) =>
            current is SpicializationsLoading ||
            current is SpicializationsSuccess ||
            current is spicializationsFailed),
        builder: (context, state) {
          return state.maybeWhen(
            spicializationsLoading: () {
              return SizedBox(
                height: 100.h,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            spicializationsSuccess: (specializationsResponseModel) {
              var specializationsResponseModelDataList =
                  specializationsResponseModel.specializationDataList;
              return setupSuccess(specializationsResponseModelDataList);
            },
            spicializationsFailed: (errorHandler) {
              return setupError();
            },
            orElse: () {
              return const SizedBox.shrink();
            },
          );
        });
  }

  Widget setupLoading() {
    return SizedBox(
      height: 100.h,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget setupSuccess(specializationsResponseModelDataList) {
    return Expanded(
      child: Column(
        children: [
          DoctorSpicialityListView(
            specializationsResponseModelDataList:
                specializationsResponseModelDataList ?? [],
          ),
          verticalSpace(8),
          DoctorsListView(
            doctorDataList:
                specializationsResponseModelDataList?[0]?.doctorsList,
          ),
        ],
      ),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
