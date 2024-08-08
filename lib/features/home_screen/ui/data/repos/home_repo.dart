import 'package:docspot/core/networking/api_result.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../apis/home_api_service.dart';
import '../models/specializations_response_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);
  Future<ApiResult<SpecializationsResponseModel>> getSpecializations() async {
    try {
      final response = await _homeApiService.getSpecializations();
      return ApiResult.sucess(response);
    } catch (getSpecializationsServiceError) {
      return ApiResult.failure(
        ErrorHandler.handle(getSpecializationsServiceError),
      );
    }
  }
}
