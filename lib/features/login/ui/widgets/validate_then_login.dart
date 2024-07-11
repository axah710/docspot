import 'package:docspot/features/login/data/models/login_request_body.dart';
import 'package:docspot/features/login/logic/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void validateThenDoLogin(BuildContext context) {
  if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    // This line checks if the form managed by the LoginCubit is valid. It
    // uses the formKey stored in the LoginCubit to access the current state
    // of the form and calls the validate method. If the form is valid
    // (i.e., all the validation rules defined in the form fields are satisfied),
    // the function proceeds.
    context.read<LoginCubit>().emitLoginStates(
          LoginRequestBody(
            email: context.read<LoginCubit>().emailController.text,
            password: context.read<LoginCubit>().passwordController.text,
          ),
        );
    // If the form is valid, this cubit creates a new LoginRequestBody
    //object, passing in the email and password from the LoginCubit's
    //emailController and passwordController, respectively.
    // Then, it calls the emitLoginStates method on the LoginCubit instance,
    // passing the LoginRequestBody object. This method likely triggers the
    //login process, emitting the necessary states to handle login requests
    //and responses.
  }
  // Do the validation ...
  // First, it validates the form.
  // If the form is validated, it emits the login states with considring the
  // login request body...
}
// It ensures that the login form is validated before attempting to log in,
// promoting clean architecture and efficient state handling.
