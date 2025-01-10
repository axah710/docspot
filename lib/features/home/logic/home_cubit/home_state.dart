import '../../../../core/networking/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/specializations_response_model.dart';
part "home_state.freezed.dart";

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

// Spicializations
  const factory HomeState.spicializationsLoading() = SpicializationsLoading;
  const factory HomeState.spicializationsSuccess(
          List<SpecializationsData?>? specializationsResponseDataModel) =
      SpicializationsSuccess;
  const factory HomeState.spicializationsFailed(ErrorHandler errorHandler) =
      spicializationsFailed;

  // Doctors
  const factory HomeState.doctorSuccess(
      List<DoctorsModel?>? doctorsListsResponseModel) = DoctorSuccess;
  const factory HomeState.doctorFailed(ErrorHandler errorHandler) =
      DoctorFailed;
}
