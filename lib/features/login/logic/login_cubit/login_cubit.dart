import '../../data/models/login_request_body.dart';
import '../../data/repos/login_repo.dart';
import 'login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/helpers/shared_preferences_helper.dart';
import '../../../../core/networking/dio_factory.dart';

class LoginCubit extends Cubit<LoginState> {
  // final LoginRepo _loginRepo;: Declares a final variable _loginRepo of type
  // LoginRepo.

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();

  final LoginRepo _loginRepo;

  // emailController and passwordController: Instances of TextEditingController
  // to manage the text input for email and password fields.
  // formKey: A key to uniquely identify the form and access its state.
  // why did i use them here ? to make less login in UI also to be reusable...

  void emitLoginStates() async {
    // Defines an asynchronous method emitLoginStates that takes a
    // LoginRequestBody object as a parameter.
    emit(const LoginState.loading());
    final response = await _loginRepo.loginRepo(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    // final response = await _loginRepo.loginRepo(: Awaits the response
    // from the loginRepo method in the _loginRepo object, passing a
    // LoginRequestBody with the email and password from the controllers.

    // Awaits the response from the loginRepo method in the _loginRepo object
    // using the provided loginRequestBody.
    response.when(
      // Uses the when method on the response to handle different outcomes:
      // failure: (error) {...}: If the login fails, emits a LoginState.failure
      // state with the error message.
      // success: (loginResponse) {...}: If the login succeeds, emits a
      // LoginState.success state with the loginResponse.
      failure: (error) {
        // If the login fails, emits a failure state with an error message.
        emit(
          LoginState.failure(
            error: error.apiErrorModel.message ?? "Something went wrong",
          ),
        );
      },
      sucess: (loginResponse) async {
        // If the login is successful, saves the user token, then emits a
        // success state with the login response.
        await saveUserToken(loginResponse.userData.token);
        emit(
          LoginState.success(loginResponse),
        );
      },
    );
    //
  }
}

/// Saves the user token securely and updates the Dio instance with the new token.
Future<void> saveUserToken(String token) async {
  await SharedPreferencesfHelper.setSecuredString(
    // Saves the token in FlutterSecureStorage.
    SharedPreferencesfKeys.userToken,
    token,
  );
  DioFactory.setTokenIntoHeaderAfterLogin(token);
  // Updates the Dio headers with the new token for authenticated API requests.
}
