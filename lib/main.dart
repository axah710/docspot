import 'package:docspot/core/DI/service_locator.dart';
import 'package:docspot/core/routing/app_router.dart';
import 'package:docspot/docspot_app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // This line initializes the service locator.
  setupGetIt();
  // Seting up dependency injection in your Flutter project using GetIt,
  //ensuring that your services are easily accessible and manageable throughout
  // your application.
  runApp(
    DocSpotApp(
      appRouter: DocSpotRouter(),
    ),
  );
}
