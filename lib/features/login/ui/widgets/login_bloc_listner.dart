import 'package:docspot/features/login/logic/login_cubit/login_cubit.dart';
import 'package:docspot/features/login/logic/login_cubit/login_state.dart';
import 'package:docspot/features/login/ui/widgets/setup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListner extends StatelessWidget {
  const LoginBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            setupLoadingState(context);
          },
          success: (loginResponse) {
            setupSuccessState(context);
          },
          failure: (error) {
            setupFailureState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
