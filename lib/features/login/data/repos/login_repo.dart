import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';

class LoginRepo {
  // Declares a final instance variable _apiService of type ApiService.
  //The final keyword ensures that _apiService can only be set once.

  LoginRepo(this._apiService);

  final ApiService _apiService;

  Future<ApiResult<LoginResponse>> loginRepo(
    // LoginRepo depends on ApiService which depends on Dio ...
    // ApiResult used here to decide whether to login(Sucess) or not(Failure)...
    LoginRequestBody loginRequestBody,
    // LoginRequestBody loginRequestBody,: A parameter of type LoginRequestBody
    // that represents the login request data.
  ) async {
    try {
      final loginResponse = await _apiService.login(loginRequestBody);
      // Purpose: Make an API call to the login endpoint.
      // Explanation: Calls the login method of _apiService with
      // loginRequestBody as the argument.
      return ApiResult.sucess(loginResponse);
    } catch (error) {
      return ApiResult.failure(
        ErrorHandler.handle(error),
      );
    }
    // purpose: Return a failure result.
    // Explanation: Calls the handle method of ErrorHandler with the caught error
    //and wraps the result in an ApiResult.failure object before returning it.
  }
}
// The LoginRepo class encapsulates the login functionality. It uses an
//instance of ApiService to make the login API call, and it returns the result
// wrapped in an ApiResult object to indicate success or failure. The
//ErrorHandler class is used to handle any errors that occur during the API
//call.
