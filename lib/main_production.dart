import 'package:docspot/core/di/service_locator.dart';
import 'package:docspot/core/routing/app_router.dart';
import 'package:docspot/docspot_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // This line initializes the service locator.
  setupGetIt();
  // Seting up dependency injection in your Flutter project using GetIt,
  //ensuring that your services are easily accessible and manageable throughout
  // your application.
  await ScreenUtil.ensureScreenSize();
  // This line ensures that the screen size is correctly set up, which is
  // important for responsive design also solve the ScreenUtil
  // problem in realse mode .

  runApp(
    DocSpotApp(
      appRouter: DocSpotRouter(),
    ),
  );
}