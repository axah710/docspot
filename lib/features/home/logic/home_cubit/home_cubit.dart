import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  Future<void> getSpecializations() async {
    emit(const HomeState.spicializationsLoading());
    final response = await _homeRepo.getSpecializations();
    response.when(
      sucess: (specializationsResponseModel) =>
          emit(HomeState.spicializationsSuccess(specializationsResponseModel)),
      failure: (specializationsResponseModelError) => emit(
          HomeState.spicializationsFailed(specializationsResponseModelError)),
    );
  }
}
