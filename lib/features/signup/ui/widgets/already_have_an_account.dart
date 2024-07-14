import 'package:docspot/core/helpers/extinsions.dart';
import 'package:docspot/core/routing/routes.dart';
import 'package:docspot/core/theming/app_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: DocSpotTextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: ' Login',
            style: DocSpotTextStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.loginScreen);
              },
          ),
        ],
      ),
    );
  }
}
