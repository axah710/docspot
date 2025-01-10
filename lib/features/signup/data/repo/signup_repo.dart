import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/signup_request_body.dart';
import '../models/signup_response.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      // try { ... } catch (failure) { ... }: Try-catch block to handle
      //potential errors during the signup process.
      final response = await _apiService.signup(signupRequestBody);
      // final response = await _apiService.signup(signupRequestBody);: Calls
      // the signup method of _apiService with the provided signupRequestBody
      // and waits for the response.
      return ApiResult.sucess(response);
      // return ApiResult.success(response);: If the API call is successful,
      // returns an ApiResult.success containing the response.
    } catch (failure) {
      return ApiResult.failure(ErrorHandler.handle(failure));
      // return ApiResult.failure(ErrorHandler.handle(failure));: If an error
      // occurs, catches the exception and returns an ApiResult.failure with
      // the handled error.
    }
  }
}
