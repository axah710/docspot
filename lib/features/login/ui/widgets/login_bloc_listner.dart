import 'package:docspot/features/login/logic/login_cubit/login_cubit.dart';
import 'package:docspot/features/login/logic/login_cubit/login_state.dart';
import 'package:docspot/features/login/ui/widgets/setup_bloc_listner_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListner extends StatelessWidget {
  const LoginBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    // This widget listens for changes in the LoginCubit state and triggers
    // a callback when the state changes.
    return BlocListener<LoginCubit, LoginState>(
      // listenWhen: This parameter takes a function(state) that decides when
      // the listener should be triggered. In this case, it listens when the
      // state is Loading, Success, or Failure.
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        // The listener parameter takes a function(state) that is called when
        // the listenWhen condition is met.
        state.whenOrNull(
          // state.whenOrNull: This method checks the current state and
          // executes the corresponding function.
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
      //  The BlocListener's child is an empty widget (SizedBox.shrink()).
      // This means LoginBlocListner is used purely for listening to state
      // changes and performing side effects rather than building UI.
    );
  }
}
