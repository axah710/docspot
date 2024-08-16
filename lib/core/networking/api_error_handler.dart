import 'package:dio/dio.dart';
import 'package:docspot/core/networking/api_contants.dart';
import 'api_error_model.dart';
// This file apply "Prefer Exceiptions to returning error codes" in Clean code book...
// By using exceptions and cases not if statements, it makes the code more readable ...

// This Dart code snippet demonstrates a structured approach to handling
//network responses and errors using enums (DataSource), constants
// (ResponseCode, ResponseMessage), extensions (DataSourceExtension), and
// exception handling (ErrorHandler). It provides a systematic way to map
// HTTP status codes and local status codes to corresponding error messages
//(ApiErrorModel) for consistent error handling in Dart/Flutter applications.
enum DataSource {
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError
}
// Defines an enum DataSource that lists various types of data sources or error
//conditions that can occur during API interactions. Each enum value
//corresponds to a specific type of error or status.

class ResponseCode {
  static const int apiLogicError = 422; // API , lOGIC ERROR
  static const int badRequest = 400; // failure, API rejected request
  static const int cacheError = -5;
  static const int cancel = -2;
  // local status code
  static const int connectTimeout = -1;

  static const int defaultError = -7;
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int noContent = 201; // success with no data (no content)
  static const int noInternetConnection = -6;
  static const int notFound = 404; // failure, not found
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int success = 200; // success with data
  static const int unauthorized = 401; // failure, user is not authorized
}
// Contains constants for various HTTP status codes and local status codes that
// can be encountered during API interactions. For example, success, noContent,
// badRequest, etc.

class ResponseMessage {
  static const String badRequest =
      ApiErrors.badRequestError; // failure, API rejected request

  static const String cacheError = ApiErrors.cacheError;
  static const String cancel = ApiErrors.defaultError;
  // local status code
  static const String connectTimeout = ApiErrors.timeoutError;

  static const String defaultError = ApiErrors.defaultError;
  static const String forbidden =
      ApiErrors.forbiddenError; //  failure, API rejected request

  static const String internalServerError =
      ApiErrors.internalServerError; // failure, crash in server side

  static const String noContent =
      ApiErrors.noContent; // success with no data (no content)

  static const String noInternetConnection = ApiErrors.noInternetError;
  static const String notFound =
      ApiErrors.notFoundError; // failure, crash in server side

  static const String receiveTimeout = ApiErrors.timeoutError;
  static const String sendTimeout = ApiErrors.timeoutError;
  static const String unauthorized =
      ApiErrors.unauthorizedError; // failure, user is not authorized
}
// Provides corresponding error messages for each response code defined in
//ResponseCode. These messages are sourced from ApiErrors class constants.

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.noContent:
        return ApiErrorModel(
          code: ResponseCode.noContent,
          message: ResponseMessage.noContent,
        );
      case DataSource.badRequest:
        return ApiErrorModel(
          code: ResponseCode.badRequest,
          message: ResponseMessage.badRequest,
        );
      case DataSource.forbidden:
        return ApiErrorModel(
          code: ResponseCode.forbidden,
          message: ResponseMessage.forbidden,
        );
      case DataSource.unauthorized:
        return ApiErrorModel(
            code: ResponseCode.unauthorized,
            message: ResponseMessage.unauthorized);
      case DataSource.notFound:
        return ApiErrorModel(
          code: ResponseCode.notFound,
          message: ResponseMessage.notFound,
        );
      case DataSource.internalServerError:
        return ApiErrorModel(
          code: ResponseCode.internalServerError,
          message: ResponseMessage.internalServerError,
        );
      case DataSource.connectTimeout:
        return ApiErrorModel(
          code: ResponseCode.connectTimeout,
          message: ResponseMessage.connectTimeout,
        );
      case DataSource.cancel:
        return ApiErrorModel(
          code: ResponseCode.cancel,
          message: ResponseMessage.cancel,
        );
      case DataSource.receiveTimeout:
        return ApiErrorModel(
          code: ResponseCode.receiveTimeout,
          message: ResponseMessage.receiveTimeout,
        );
      case DataSource.sendTimeout:
        return ApiErrorModel(
          code: ResponseCode.sendTimeout,
          message: ResponseMessage.sendTimeout,
        );
      case DataSource.cacheError:
        return ApiErrorModel(
          code: ResponseCode.cacheError,
          message: ResponseMessage.cacheError,
        );
      case DataSource.noInternetConnection:
        return ApiErrorModel(
          code: ResponseCode.noInternetConnection,
          message: ResponseMessage.noInternetConnection,
        );
      case DataSource.defaultError:
        return ApiErrorModel(
          code: ResponseCode.defaultError,
          message: ResponseMessage.defaultError,
        );
    }
  }
}
// Extends DataSource enum to provide a method getFailure() which returns an
// ApiErrorModel based on the enum value. It maps each DataSource value to the
// corresponding ResponseCode and ResponseMessage.

class ErrorHandler implements Exception {
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      // default error
      apiErrorModel = DataSource.defaultError.getFailure();
    }
  }

  late ApiErrorModel apiErrorModel;
}
// mplements an exception handler (Exception) that initializes an apiErrorModel
// based on the type of error received (DioException or default error). It uses
// _handleError() function for DioException errors and DataSource.defaultError
// for other errors.

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.defaultError.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.defaultError.getFailure();
  }
}

// Takes a DioException error as input and returns an ApiErrorModel based on
//the DioErrorType. It maps each error type to the appropriate DataSource enum
// value and retrieves the corresponding failure ApiErrorModel.
class ApiInternalStatus {
  static const int failure = 1;
  static const int success = 0;
}
// Contains constants for API internal status, specifically success and failure,
// represented as integer values (0 and 1 respectively).
