import 'package:docspot/core/networking/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';

@Freezed()
// This Dart code snippet is using the freezed_annotation package to generate
// immutable classes for ApiResult. The ApiResult class is defined as an abstract
//class with generic type T. It has two factory constructors: failure and success,
// which are defined using the @Freezed annotation.

// By using @Freezed and the generated part file api_result.freezed.dart, the
// code ensures that the ApiResult class is immutable and provides convenient
//ways to create instances of Failure and Success without the need for manual
//implementation.
abstract class ApiResult<T> with _$ApiResult<T> {
  // This line defines an abstract class ApiResult with a generic type T.
  // The with _$ApiResult<T> part is a mixin that will be generated by the
  // freezed package and will contain the implementation of the class.
  const factory ApiResult.failure(ErrorHandler errorHndler) = Failure<T>;

  // The failure factory constructor takes a String message parameter and creates
  //an instance of Failure<T>.
  const factory ApiResult.sucess(T data) = Sucess<T>;

  //  The success factory constructor takes a generic T
  //data parameter and creates an instance of Success<T>.
  // Data will be used by instance of Success<T> and then takes an action ...
  // The factory constructor in Dart allows for custom instance creation with
  //additional logic if needed. In the case of ApiResult.success(T data) =
  // Success<T>;, it defines how a successful result (Success<T>) is
  //instantiated within the framework of freezed, ensuring type safety,
  // immutability, and clear separation of success and failure outcomes in
  //your application logic.
}
// Instead of using Either class for success and failure ...
// This approach helps in handling different outcomes (success and failure) in
//a type-safe and concise manner, making the code more robust and easier
// to work with.
