import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  // Navigation Extension on BuildContext: This extension adds several
  //convenience methods to the BuildContext class for easier navigation
  //within a Flutter app.
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

// pushNamed(String routeName, {Object? arguments}): This method allows you to
//navigate to a new route by its name, optionally passing arguments.
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

// pushReplacementNamed(String routeName, {Object? arguments}): This method
//replaces the current route with a new route by its name, optionally
// passing arguments.
  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

// pushNamedAndRemoveUntil(String routeName,
// {Object? arguments, required RoutePredicate predicate}): This method pushes a
// new route and removes all the previous routes until the predicate returns true.
  void pop() => Navigator.of(this).pop();
  // pop(): This method pops the current route off the navigator stack.
  // These methods utilize the Navigator class to manage the app's navigation stack.
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
