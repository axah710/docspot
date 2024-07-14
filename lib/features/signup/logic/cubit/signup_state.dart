import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
// @freezed: Annotation used to indicate that the SignupState class should be
// processed by the freezed package to generate code for immutable states.
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.initial() = _Initial;
// const factory SignupState.initial() = _Initial;: Defines an initial
// state variant _Initial.
  const factory SignupState.signupLoading() = SignupLoading;
  // const factory SignupState.signupLoading() = SignupLoading;: Defines
  // a loading state variant SignupLoading.
  const factory SignupState.signupSuccess(T data) = SignupSuccess<T>;
  // const factory SignupState.signupSuccess(T data) = SignupSuccess<T>;:
  // Defines a success state variant SignupSuccess that carries a generic
  // T type data.
  const factory SignupState.signupError({required String error}) = SignupError;
  // const factory SignupState.signupError({required String error}) =
  // SignupError;: Defines an error state variant SignupError that carries a
  // required error message.
}
