import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../logic/home_cubit/home_cubit.dart';
import '../../../logic/home_cubit/home_state.dart';
import '../home_shimmer/doctors_shimmer_loading.dart';
import '../home_shimmer/speciality_shimmer_loading.dart';
import 'spiciality_list_view.dart';

class SpeclizationAndDoctorBlocBuilder extends StatelessWidget {
  const SpeclizationAndDoctorBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: ((previous, current) =>
            current is SpicializationsLoading ||
            current is SpicializationsSuccess ||
            current is spicializationsFailed),
        // A function that determines if the widget should rebuild.
        // It optimizing performance by avoiding unnecessary
        // rebuilds for other states.
        builder: (context, state) {
          return state.maybeWhen(
            // Allows handling specific states .
            spicializationsLoading: () {
              return setupLoading();
            },
            spicializationsSuccess: (specializationsResponseDataModel) {
              var specializationsResponseModelDataList =
                  specializationsResponseDataModel;
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
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpace(8),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupSuccess(specializationsResponseModelDataList) {
    return SpicialityListView(
      specializationsResponseModelDataList:
          specializationsResponseModelDataList ?? [],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
