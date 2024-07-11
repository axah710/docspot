import 'package:docspot/features/login/data/models/login_request_body.dart';
import 'package:docspot/features/login/logic/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void validateThenTakeLogin(BuildContext context) {
  if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    context.read<LoginCubit>().emitLoginStates(
          LoginRequestBody(
            email: context.read<LoginCubit>().emailController.text,
            password: context.read<LoginCubit>().passwordController.text,
          ),
        );
  }
  // Do the validation ...
  // If the login is validated so emit the login states with the login
  //request body...
}
