import '../../../../core/helpers/extinsions.dart';
import '../../data/models/specializations_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  // A private variable holding an instance of HomeRepo, used to fetch data
  // from the repository.

  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  List<SpecializationsData?>? specializationsList = <SpecializationsData?>[];
  // A list that will hold the fetched specializations data.

  /// A method that fetches specializations asynchronously.
  Future<void> getSpecializations() async {
    emit(const HomeState.spicializationsLoading());
    final response = await _homeRepo.getSpecializations();
    // Calls the repository method to fetch the list of specializations.
    response.when(
      sucess: (specializationsResponseModel) {
        specializationsList =
            specializationsResponseModel.specializationDataList ?? [];
        // Get the first specialization id and get the doctors list of that
        getDoctorsList(
          spicializationId:
              specializationsResponseModel.specializationDataList?.first?.id ??
                  1,
        );
        // After fetching the specializations, it calls getDoctorsList()
        // with the first specialization ID
        // (or a fallback of 1 if the list is empty) to automatically fetch \
        // the doctors for the first specialization.
        emit(HomeState.spicializationsSuccess(specializationsList));
      },
      failure: (specializationsResponseModelError) => emit(
        HomeState.spicializationsFailed(specializationsResponseModelError),
      ),
    );
  }

  /// A method to fetch the list of doctors for a specific specialization ID.
  getDoctorsList({required int? spicializationId}) {
    List<DoctorsModel?>? spicializationDoctorsList =
        filterAndGetDoctorsListBySpecializationId(spicializationId);
    // Calls a helper method to filter the doctors based on the
    // specialization ID.
    if (!spicializationDoctorsList.isNullOrEmpty()) {
      emit(
        HomeState.doctorSuccess(spicializationDoctorsList),
      );
    } else {
      emit(
        HomeState.doctorFailed(
          ErrorHandler.handle("No doctors found"),
        ),
      );
    }
  }

  /// This method filters the list of specializations to find the one with
  /// the matching specialization ID and returns its list of doctors.
  List<DoctorsModel?>? filterAndGetDoctorsListBySpecializationId(
    // Returns a list of doctors based on the specialization id .

    int? spicializationId,
  ) {
    // I want to get the specializations then loop by specialization id and
    // get the doctors list of that each specialization by that id ...
    return specializationsList
            ?.firstWhere(
                (spicialization) => spicialization?.id == spicializationId)
            ?.doctorsList ??
        [];
    // If no matching specialization is found, it returns an empty list.
  }
}
