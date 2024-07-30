import 'package:docspot/core/routing/app_router.dart';
import 'package:docspot/core/routing/routes.dart';
import 'package:docspot/core/theming/app_colors.dart';
import 'package:docspot/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/constants.dart';

class DocSpotApp extends StatelessWidget {
  final DocSpotRouter appRouter;
  // To make a connection between AppRouter and DocSpotApp...

  const DocSpotApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Adapt the UI to different screen sizes and orientations.
      designSize: const Size(375, 812),
      // specifies the base design size for the app, which helps in scaling
      //the UI elements appropriately.
      minTextAdapt: true,
      // ensures that text scales according to the screen size.
      splitScreenMode: true,
      //  allows the app to handle split-screen mode effectively.
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DocSpot',
        theme: ThemeData(
          primaryColor: DocSpotColorsManager.primaryBlueColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: isLoggedInUser ? Routes.homeScreen : Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
        home: const OnBoardingScreen(),
      ),
    );
  }
}
