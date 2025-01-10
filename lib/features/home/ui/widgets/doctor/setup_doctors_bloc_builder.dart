import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/specializations_response_model.dart';
import '../../../logic/home_cubit/home_cubit.dart';
import '../../../logic/home_cubit/home_state.dart';
import 'doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: ((previous, current) =>
          current is DoctorSuccess || current is DoctorFailed),
      // A function that determines whether the widget should rebuild.
      // This optimization prevents unnecessary rebuilds for other states.

      builder: (context, state) {
        return state.maybeWhen(
          // A method that allows you to handle specific states. It matches
          // the current state and executes the corresponding function:
          doctorSuccess: (doctorsListsResponseModel) {
            return setupSuccess(doctorsListsResponseModel);
          },
          doctorFailed: (errorHandler) {
            return setupError(errorHandler);
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}

Widget setupError(ErrorHandler errorHandler) {
  return Text(errorHandler.apiErrorModel.message.toString());
}

Widget setupSuccess(List<DoctorsModel?>? doctorsListsResponseModel) {
  return DoctorsListView(
    doctorDataList: doctorsListsResponseModel,
  );
}
