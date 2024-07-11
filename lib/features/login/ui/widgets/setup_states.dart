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
}

void setupFailureState(BuildContext context, String failure) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          failure,
          style: DocSpotTextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
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
}
