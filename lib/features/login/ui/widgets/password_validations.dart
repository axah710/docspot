import 'package:docspot/core/helpers/spacing.dart';
import 'package:docspot/features/login/ui/widgets/build_validation_row.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowercaseLetter;
  final bool hasUppercaseLetter;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinimumLength;
  const PasswordValidations({
    super.key,
    required this.hasLowercaseLetter,
    required this.hasUppercaseLetter,
    required this.hasNumber,
    required this.hasSpecialCharacter,
    required this.hasMinimumLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(
          "At least one lowercase letter",
          hasLowercaseLetter,
        ),
        verticalSpace(2),
        buildValidationRow(
          "At least one uppercase letter",
          hasUppercaseLetter,
        ),
        verticalSpace(2),
        buildValidationRow(
          "At least one number",
          hasNumber,
        ),
        verticalSpace(2),
        buildValidationRow(
          "At least one special character",
          hasSpecialCharacter,
        ),
        verticalSpace(2),
        buildValidationRow(
          "At least 8 characters",
          hasMinimumLength,
        ),
      ],
    );
  }
}
