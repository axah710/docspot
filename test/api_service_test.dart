import 'package:docspot/core/networking/api_contants.dart';
import 'package:docspot/core/networking/api_service.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:docspot/features/signup/data/models/signup_request_body.dart';
import 'package:docspot/features/signup/data/models/signup_response.dart';

// Generate the mock class for ApiService
//! By using a mock version of ApiService, you isolate your unit tests from the real API. This ensures that your tests do not rely on network requests or external systems, making them faster and more reliable.
@GenerateMocks([ApiService])
import 'api_service_test.mocks.dart';

void main() {
  //! Declares a variable mockApiService of type MockApiService. It’s marked as late, meaning it will be initialized later, usually inside setUp.

  late MockApiService mockApiService;
  //! The setUp function runs before each test. Here, it initializes mockApiService by creating a new instance of MockApiService so that each test starts with a fresh mock object.

  setUp(() {
    mockApiService = MockApiService();
  });

  SignupRequestBody createSignupRequest({
    String email = 'newuser@example.com',
    String password = 'password123',
    String name = 'New User',
    String phone = '1234567890',
    String passwordConfirmation = 'password123',
    int gender = 0,
  }) {
    return SignupRequestBody(
      email: email,
      password: password,
      name: name,
      phone: phone,
      passwordConfirmation: passwordConfirmation,
      gender: gender,
    );
  }

  //! Defines a test case to check the behavior of the signup method for a successful response. It's marked as async because API calls return Future objects and must be awaited.

  test('Test signup API success response', () async {
    //! Creates an instance of SignupRequestBody with sample data to simulate a signup request.

    final signupRequest = createSignupRequest();
    //! Creates an instance of SignupResponse representing the expected response from the server after a successful signup.

    final signupResponse = SignupResponse(
      message: 'Signup successful',
      status: true,
    );
    //! This is the core of mocking. Here, we're telling mockito to simulate a successful API call when the signup method is called with signupRequest. Instead of making an actual API call, thenAnswer immediately returns the signupResponse.

    when(mockApiService.signup(signupRequest)).thenAnswer(
      (_) async => signupResponse,
    );

    // Act: call the signup function
    //! Calls the signup method on the mock object and stores the result in result. Since it's a mock, the method returns the signupResponse defined earlier.

    final result = await mockApiService.signup(signupRequest);

    // Assert: check if the result matches the expected response
    //! Asserts that the status of the response is true, indicating a successful signup.

    expect(result.status, true);
    //! Asserts that the message of the response is 'Signup successful', matching the expected value.

    expect(result.message, 'Signup successful');
  });
  //! This test simulates a failure scenario where the API throws an exception instead of returning a success response.

  test('Test signup API failure response', () async {
    //! Arrange: mock a failed response for signup

    final signupRequest =
        createSignupRequest(email: 'existinguser@example.com');

    //! Mocks the signup method to throw a DioException. This simulates an API failure (e.g., the user already exists, or there's a server error).

    when(mockApiService.signup(signupRequest)).thenThrow(
      DioException(
        requestOptions: RequestOptions(path: ApiConstants.signupUrl),
      ),
    );
    // Act & Assert: expect an exception to be thrown
    //! Asserts that calling signup with the given request should throw an exception, specifically a DioException.
    //! throwsException: checks that any exception is thrown.
    expect(
      () async => await mockApiService.signup(signupRequest),
      throwsA(isA<DioException>()),
      //! throwsA(isA<DioException>()): checks that the thrown exception is of type DioException.
      // skip: 'This test is currently not applicable',
      //! Use @Skip in Dart to ignore tests for incomplete features or temporary issues.
    );
  });
}
////? The tests we implemented provide several key benefits:

////! The tests act as a form of documentation for expected behavior.
////! By reading the test, you can immediately understand what the API service
////! should do in different scenarios (e.g., a successful signup vs. a failed signup).

////! The second test, which simulates
////! a failed API response, ensures that your application gracefully handles
////! API errors. This prevents potential crashes or unhandled exceptions in the
////! app when the API returns an error (e.g., invalid credentials, existing email).

////! These tests validate that your app follows the contract with the API.
////! By mocking the expected responses, you're ensuring that the app behaves
////! correctly according to the structure of the request
////! (SignupRequestBody) and response (SignupResponse).


////? Summary:

////! Ensures the app handles signup functionality correctly.
////! No dependency on actual API availability during tests.
////! Automatic validation of API handling during development and refactoring.


////? Network request unit testing:

////! We will use Mockito and build_runner packages. The build_runner will generate mock classes that simulate the real Dio.
////! MockDio() is a mock request instance. If we used Dio(), it would make real requests, but here we only simulate the operation.
////! We will create test groups that contain test cases. We use `when()` to simulate the request and `thenAnswer()` to simulate the response.
////! Mock data simulates the real data to avoid making real network requests, allowing us to work with the simulated mock class.