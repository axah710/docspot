import 'core/di/service_locator.dart';
import 'core/helpers/extinsions.dart';
import 'core/routing/app_router.dart';
import 'docspot_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/constants.dart';
import 'core/helpers/shared_preferences_helper.dart';
import 'core/helpers/simple_bloc_observer.dart';

void main() async {
    Bloc.observer = SimpleBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  // This line initializes the service locator.
  setupGetIt();
  // Seting up dependency injection in your Flutter project using GetIt,
  // ensuring that your services are easily accessible and manageable throughout
  // your application.
  await ScreenUtil.ensureScreenSize();
  // This line ensures that the screen size is correctly set up, which is
  // important for responsive design also solve the ScreenUtil
  // problem in realse mode .
  // debugPaintSizeEnabled = true;
  await checkIfLoggedInUser();
  // Checks if there is a logged-in user by retrieving a token from
  // secure storage.

  runApp(
    DocSpotApp(
      appRouter: DocSpotRouter(),
    ),
  );
}

checkIfLoggedInUser() async {
  // An asynchronous function that checks if a user token is stored in
  // secure storage.
  String? userToken = await SharedPreferencesfHelper.getSecuredString(
    SharedPreferencesfKeys.userToken,
    // A helper method to retrieve a secured string (user token) from
    // Flutter Secure Storage.
  );
  if (!userToken.isNullOrEmpty()) {
    // Checks if the retrieved token is neither null nor empty. The extension
    // method isNullOrEmpty is defined in extinsions.dart.
    isLoggedInUser = true;
    // Sets a global variable to indicate that
    // the user is logged in.
  } else {
    isLoggedInUser = false;
  }
}
