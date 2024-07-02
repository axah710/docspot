import 'package:docspot/core/helpers/spacing.dart';
import 'package:docspot/core/theming/app_colors.dart';
import 'package:docspot/core/theming/app_fonts.dart';
import 'package:docspot/core/widgets/app_text_button.dart';
import 'package:docspot/core/widgets/build_divider.dart';
import 'package:docspot/core/widgets/svg_displayer.dart';
import 'package:docspot/core/widgets/text_form_field.dart';
import 'package:docspot/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:docspot/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObSecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
              vertical: 30.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: DocSpotTextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: DocSpotTextStyles.font14LightGrayRegular,
                ),
                verticalSpace(36),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const DocSpotTextFormField(
                        hintText: 'Email',
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
                            isObSecureText
                                ? Icons.visibility_off
                                : Icons.visibility,
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
                      ),
                      verticalSpace(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          "Forget Passwod ?",
                          style: DocSpotTextStyles.font13BlueRegular,
                        ),
                      ),
                      verticalSpace(40),
                      DocSpotTextButton(
                        buttonText: "Login",
                        textStyle: DocSpotTextStyles.font16WhiteSemiBold,
                        onPressed: () {},
                      ),
                      verticalSpace(46),
                      Row(
                        children: [
                          const BuildDivider(),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              "Or Sign In With",
                              style: DocSpotTextStyles.font12stoneyGreyRegular,
                            ),
                          ),
                          const BuildDivider(),
                        ],
                      ),
                      verticalSpace(32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SvgDisplayer(
                            assetName:
                                "assets/svgs/google_login_alternative.svg",
                          ),
                          horizontalSpace(32),
                          const SvgDisplayer(
                            assetName:
                                "assets/svgs/facebook_login_alternative.svg",
                          ),
                          horizontalSpace(32),
                          const SvgDisplayer(
                            assetName:
                                "assets/svgs/apple_login_alternative.svg",
                          ),
                        ],
                      ),
                      verticalSpace(32),
                      const TermsAndConditionsText(),
                      verticalSpace(60),
                      const DontHaveAccountText()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
