import 'package:dio/dio.dart';
import 'package:docspot/core/networking/api_contants.dart';
import 'package:docspot/features/login/data/models/login_request_body.dart';
import 'package:docspot/features/login/data/models/login_response.dart';
import 'package:docspot/features/signup/data/models/signup_request_body.dart';
import 'package:docspot/features/signup/data/models/signup_response.dart';
import 'package:retrofit/http.dart';
part "api_service.g.dart";

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
// @RestApi(baseUrl: ApiConstants.apiBaseUrl): Annotation to define a base URL
// for all API requests. The ApiConstants.apiBaseUrl is a constant that holds
//the base URL string.

abstract class ApiService {
  // abstract class ApiService: Declares an abstract class ApiService, which
  // Retrofit will use to generate an implementation.
  factory ApiService(
    Dio dio, {
    String baseUrl,
  }) = _ApiService;
// factory ApiService(Dio dio, {String baseUrl}) = _ApiService;: Factory
//constructor that creates an instance of _ApiService. This constructor
//requires a Dio instance and optionally a baseUrl. The _ApiService class will
// be generated by Retrofit.
//ApiService Depends on Dio
  @POST(ApiConstants.loginUrl)

  // @POST(ApiConstants.loginUrl): Annotation to specify that this method makes
  // a POST request to the URL defined by ApiConstants.loginUrl.
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
  // Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);:
  // Method declaration for the login request. It takes a LoginRequestBody
  // object as the request body and returns a Future<LoginResponse>.
  // The @Body() annotation tells Retrofit to use loginRequestBody as the body
  // of the POST request.
  @POST(ApiConstants.signupUrl)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);
  // @POST(ApiConstants.signupUrl): Annotation specifying that this method
  // makes a POST request to the URL defined by ApiConstants.signupUrl.
  // Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);:
  // Method declaration for the signup request. It takes a SignupRequestBody
  // object as the request body and returns a Future<SignupResponse>. The
  // @Body() annotation tells Retrofit to use signupRequestBody as the body of
  // the POST request.
}
// This Dart code snippet defines an abstract class ApiService using the
//retrofit package for making HTTP requests. It specifies a base URL using
//@RestApi annotation and includes a method login for sending a POST request
// to the login URL with a LoginRequestBody object as the request body. The
//ApiService class is generated using a part file api_service.g.dart which
// contains the implementation details.

// In detail, the code snippet sets up an API service interface that defines the
// structure for making API calls, specifically a login request in this case. It
//utilizes annotations like @RestApi and @POST to configure the base URL and HTTP
// method for the API endpoint. The login method specifies the request body
// parameter and the expected response type.

// Overall, this code snippet is a concise way to define an API service interface
//in Dart using the retrofit package, making it easier to interact with APIs
//in a type-safe manner.

// Generated Code: The part directive api_service.g.dart includes the generated
// implementation. You do not need to write the HTTP request code yourself;
// Retrofit handles it based on your annotations and method signatures.

// Type Safety: By defining request and response models (LoginRequestBody and
// LoginResponse), you ensure that the data structures are type-safe and match
// the expected API format.

// This setup abstracts away the complexity of making HTTP requests and parsing
// responses, providing a clean and type-safe API interface.