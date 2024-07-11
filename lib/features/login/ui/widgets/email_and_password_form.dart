import 'package:docspot/core/helpers/docspot_regex.dart';
import 'package:docspot/core/helpers/spacing.dart';
import 'package:docspot/core/theming/app_colors.dart';
import 'package:docspot/core/widgets/text_form_field.dart';
import 'package:docspot/features/login/logic/login_cubit/login_cubit.dart';
import 'package:docspot/features/login/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPasswordForm extends StatefulWidget {
  const EmailAndPasswordForm({super.key});

  @override
  State<EmailAndPasswordForm> createState() => _EmailAndPasswordFormState();
}

class _EmailAndPasswordFormState extends State<EmailAndPasswordForm> {
  bool isObSecureText = true;
  bool hasLowercaseLetter = false;
  bool hasUppercaseLetter = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinimumLength = false;
  late TextEditingController passwordController;
  // passwordController will be used to store the password entered by the user,
  // and late means it will be initialized later in the build method.
  // passwordController: A TextEditingController for managing the password input.

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    // That's how we can access the LoginCubit and passwordController from the
    // context.
    // passwordController takes the value of the password that lives in the
    // cubit.
    setupPasswordControllerListner();
  }

  // The initState method initializes the state of the widget. It fetches the
  // passwordController from the LoginCubit and sets up a listener for it.

  void setupPasswordControllerListner() {
    passwordController.addListener(
      () {
        setState(
          () {
            hasLowercaseLetter = DocspotRegex.hasLowerCase(
              passwordController.text,
            );
            hasUppercaseLetter = DocspotRegex.hasUpperCase(
              passwordController.text,
            );
            hasNumber = DocspotRegex.hasNumber(
              passwordController.text,
            );
            hasSpecialCharacter = DocspotRegex.hasSpecialCharacter(
              passwordController.text,
            );
            hasMinimumLength = DocspotRegex.hasMinLength(
              passwordController.text,
            );
          },
        );
      },
    );
    // to listen to the changes of the user text and match it with the regex.
  }
  // This method sets up a listener on the passwordController. When the
  // password input changes, it updates the state variables by checking the
  // password against different criteria using DocspotRegex.

  @override
  void dispose() {
    context.read<LoginCubit>().passwordController.dispose();
    super.dispose();
  }

  // Cleans up resources when the widget is disposed of, disposing of the
  // password controller.

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      // Wraps the entire form and associates it with the formKey from
      // LoginCubit.

      child: Column(
        children: [
          DocSpotTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !DocspotRegex.isEmailValid(value)) {
                return 'Please enter a valid email address';
              }
            },
            // validator: Ensures the input is a valid email.
            controller: context.read<LoginCubit>().emailController,
            // controller: Manages the email input, fetched from LoginCubit.
          ),
          verticalSpace(18),
          DocSpotTextFormField(
            hintText: 'Password',
            isObscureText: isObSecureText,
            // isObscureText: isObSecureText:
            // The isObscureText property determines whether the
            // text in the input field should be obscured (hidden)
            // or visible. The value is controlled by the
            //isObSecureText boolean variable.
            suffixIcon: IconButton(
              icon: Icon(
                isObSecureText ? Icons.visibility_off : Icons.visibility,
                color: DocSpotColorsManager.darkBlue,
              ),
              // icon: Icon(...):
              // The icon property of the IconButton is set to an Icon
              //widget. The icon displayed depends on the value of
              //isObSecureText:
              // If isObSecureText is true, the icon is
              // Icons.visibility_off, indicating that the text is
              // currently hidden.
              // If isObSecureText is false, the icon is
              // Icons.visibility, indicating that the text is
              // currently visible.
              // The color of the icon is set to
              // DocSpotColorsManager.darkBlue.
              onPressed: () {
                setState(
                  () {
                    isObSecureText = !isObSecureText;
                  },
                );
              },
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password ';
              }
            },
            controller: context.read<LoginCubit>().passwordController,
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowercaseLetter: hasLowercaseLetter,
            hasMinimumLength: hasMinimumLength,
            hasNumber: hasNumber,
            hasSpecialCharacter: hasSpecialCharacter,
            hasUppercaseLetter: hasUppercaseLetter,
          ),
          // PasswordValidations: Displays the password validation criteria.
        ],
      ),
    );
  }
}
