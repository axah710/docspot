import 'package:docspot/core/helpers/extinsions.dart';
import 'package:docspot/core/routing/routes.dart';
import 'package:docspot/core/theming/app_colors.dart';
import 'package:docspot/core/theming/app_fonts.dart';
import 'package:flutter/material.dart';

void setupSuccessState(BuildContext context) {
  context.pop();
  // To dismiss the dialog ..
  context.pushNamed(
    Routes.homeScreen,
  );
  // This function handles the success state in the app.
// context.pop();: Closes the current dialog or screen.
// context.pushNamed(Routes.homeScreen);: Navigates to the home screen defined
// in the routes.
}

void setupLoadingState(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(
          color: DocSpotColorsManager.primaryBlueColor,
        ),
      );
    },
  );
  // This function displays a loading state using a circular progress indicator.
// showDialog(context: context, builder: (context) {...});: Displays a dialog.
// The dialog contains a centered CircularProgressIndicator with a primary blue
// color from DocSpotColorsManager.
}

void setupFailureState(BuildContext context, String failure) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: const Icon(
          Icons.error,
          color: DocSpotColorsManager.red,
          size: 32,
        ),
        content: Text(
          failure,
          style: DocSpotTextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: DocSpotColorsManager.red,
            ),
            onPressed: () {
              context.pop();
            },
            child: Text(
              'OK',
              style: DocSpotTextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      );
    },
  );
  // This function handles the failure state by showing an error dialog.
// context.pop();: Closes the current dialog or screen.
// showDialog(context: context, builder: (context) {...});: Displays an
// error dialog.

// The dialog contains:
// An error icon.
// A text message displaying the failure string.
// An "OK" button to close the dialog, styled with red text.
}

// Functions: Handle different UI states (success, loading, failure) by
// displaying appropriate dialogs or navigating to screens.
