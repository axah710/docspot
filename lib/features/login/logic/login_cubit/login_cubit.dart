import 'package:docspot/features/login/data/models/login_request_body.dart';
import 'package:docspot/features/login/data/repos/login_repo.dart';
import 'package:docspot/features/login/logic/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  // final LoginRepo _loginRepo;: Declares a final variable _loginRepo of type
  // LoginRepo.

  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
        emit(
          LoginState.failure(
            error: error.apiErrorModel.message ?? "Something went wrong",
          ),
        );
      },
      sucess: (loginResponse) {
        emit(
          LoginState.success(loginResponse),
        );
      },
    );
    //
  }
}