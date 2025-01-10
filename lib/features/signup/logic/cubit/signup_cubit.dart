import '../../data/models/signup_request_body.dart';
import '../../data/repo/signup_repo.dart';
import 'signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  // TextEditingController: Controllers for text input fields
  // (name, email, phone, password, password confirmation).
  final formKey = GlobalKey<FormState>();
  // final formKey = GlobalKey<FormState>();: A key for the form widget,
  // used to validate the form.

  void emitSignupStates() async {
    emit(const SignupState.signupLoading());
    // emit(const SignupState.signupLoading());: Emits a loading state
    // before making the API call.
    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );
    // final response = await _signupRepo.signup(...);: Calls the signup
    // method of _signupRepo with the SignupRequestBody created from the
    // input controllers and waits for the response.
    response.when(sucess: (signupResponse) {
      emit(SignupState.signupSuccess(signupResponse));
    }, failure: (error) {
      emit(SignupState.signupError(
        error: error.apiErrorModel.message ?? ' Something went wrong',
      ));
    });
  }
  // response.when(sucess: (signupResponse) { ... }, failure: (error) { ... });:
  // Handles the response, emitting success or error states based on the result.
}
