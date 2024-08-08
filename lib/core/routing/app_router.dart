import 'package:docspot/core/di/service_locator.dart';
import 'package:docspot/core/routing/routes.dart';
import 'package:docspot/features/home/logic/home_cubit/home_cubit.dart';
import 'package:docspot/features/home/ui/screens/home_screen.dart';
import 'package:docspot/features/login/logic/login_cubit/login_cubit.dart';
import 'package:docspot/features/login/ui/login_screen.dart';
import 'package:docspot/features/onboarding/ui/onboarding_screen.dart';
import 'package:docspot/features/signup/logic/cubit/signup_cubit.dart';
import 'package:docspot/features/signup/ui/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocSpotRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            // getIt<LoginCubit>() is a function call to a service locator
            // (typically get_it package) that retrieves an instance of LoginCubit.
            // Service Locator Setup: To use getIt, you need to set up the service
            // locator in your application. This involves registering your
            // LoginCubit and other dependencies with getIt.
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(getIt()),
            // HomeCubit(getIt()),
            // same as:
            // getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
            child: const HomeScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      default:
        return null;
      // MaterialPageRoute(
      //   builder: (context) => Scaffold(
      //     body: Center(
      //       child: Text(
      //         "No route defined for ${settings.name}",
      //       ),
      //     ),
      //   ),
      // );
    }
  }
}
// The code snippet is a class named AppRouter that contains a method
// generateRoute which determines the route to be displayed based
// on the provided settings.
// The method generateRoute takes a settings object as input.
// It checks the name property of the settings object using a switch statement.
// If the name matches Routes.onBoardingScreen, it returns a
// MaterialPageRoute with a screen.
// If the name matches Routes.loginScreen, it returns a
// MaterialPageRoute with a screen.
// If no match is found, it returns a MaterialPageRoute with a Scaffold
// displaying a message indicating the route name that was not defined.
