import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/constants.dart';
import '../helpers/shared_preferences_helper.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

// DioFactory._();: This is a private constructor, meaning you cannot create
// an instance of DioFactory directly from outside the class. This is done to
// enforce that only one instance of Dio is created and used throughout the
// app.

  static Dio? dio;
  // uses design pettern called singleton to create a single instance of Dio ...

  // It contains a static nullable Dio instance named dio that is lazily
  //initialized when getDio() method is called.
  // The static keyword means this variable is shared among all instances of the
  // DioFactory class.
  static Dio getDio() {
    // The getDio() method returns the existing dio instance if it exists,
    // otherwise creates a new instance, sets timeout options, adds an
    //interceptor using PrettyDioLogger, and returns the dio instance.
    // This is a static method, meaning it can be called without creating an
    //instance of DioFactory.
    Duration timeOut = const Duration(
      seconds: 30,
    );
    // This sets a timeout duration of 30 seconds for connection and response.
    // a simple config setup .
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      // dio!.options.connectTimeout = timeOut: Sets the connection timeout for
      // the Dio instance.
      // dio!.options.receiveTimeout = timeOut: Sets the receive timeout for
      //the Dio instance.

      addDioHeaders();
      // addDioHeaders: Adds default headers to the Dio instance.
      addDioInterceptor();
      // addDioInterceptor: Adds an interceptor to log request and response details.

      addCheckRefreshTokenDioInterceptor();
      // addCheckRefreshTokenDioInterceptor:
      // Adds an interceptor to check if the token is expired or not.
      return dio!;
      // return dio!;: Returns the initialized Dio instance.
    } else {
      return dio!;
      // else { return dio!; }: If dio is already initialized, it simply
      //returns the existing instance.
    }
  }

  ///Sets default headers for the Dio instance.
  static void addDioHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${await SharedPreferencesfHelper.getSecuredString(SharedPreferencesfKeys.userToken)}',
    };
    // Purpose:
    // Sets default headers for the Dio instance, including:
    // Accept Header: Indicates that the client expects JSON responses.
    // Authorization Header: Adds an authorization token fetched from
    // FlutterSecureStorage using SharedPreferencesfHelper. The token is used to
    // authenticate requests.
  }

  /// Updates the Authorization header with a new token after a user logs in.
  /// This method allows dynamic updating of the token in the headers.
  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }
  // show how you could add headers to the Dio instance:
  // addDioHeaders: Adds default headers, including an authorization token
  // fetched from shared preferences.
  // setTokenIntoHeaderAfterLogin: Sets the authorization header after logging in.

  /// This method adds a PrettyDioLogger interceptor
  /// to log request and response details for debugging purposes.
  static void addDioInterceptor() {
    PrettyDioLogger(
      requestBody: true,
      //  Logs the request body.
      requestHeader: true,
      // Logs the request headers.
      responseHeader: true,
      //  Logs the response headers.
      request: true,
      // Logs the request.
      responseBody: true,
      // Logs the response body.
      error: true,
      //  Logs any errors.
      compact: true,
      // Logs the details in a compact format.
    );
  }

  /// This method adds a Check Refresh Token Dio Interceptor
  /// to check if the token is expired or not.
  static void addCheckRefreshTokenDioInterceptor() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // This onRequest method is called before the request is sent.
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // This onResponse method is called after the response is received.
          log("response ${response.data}");
          // return handler.next(response);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            // This onError method is called when an error occurs while sending
            // or receiving the request.
            // Can be used with refresh token in case of 401 (Expired token).
            //! Need to add the refresh token logic.
            log("response ${e.error}");

            // return handler.next(e);
          }
        },
      ),
    );
  }
}
// This Dart code snippet defines a DioFactory class responsible for creating
//and managing a Dio instance for making HTTP requests using the Dio package.
