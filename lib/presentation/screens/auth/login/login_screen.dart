import 'package:chat_app/config/theme/app_theme.dart';
import 'package:chat_app/core/constants/app_sizes.dart';
import 'package:chat_app/core/widgets/custom_gradient_button.dart';
import 'package:chat_app/core/widgets/custom_text_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/constants/app_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /// Here form is used for validating the user credentials
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.size8),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSizes.size30),
              Text(AppConstants.welcomeBack,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: AppSizes.size10),
              Text(AppConstants.signInToContinue,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey)),
              SizedBox(height: AppSizes.size20),
              CustomTextFields(
                textEditingController: email,
                hintText: AppConstants.email,
                prefixIcon: Icon(Icons.email),
              ),
              SizedBox(height: AppSizes.size20),
              CustomTextFields(
                textEditingController: password,
                hintText: AppConstants.password,
                prefixIcon: Icon(Icons.lock_outline),
                obscureText: true,
                suffixIcon: Icon(Icons.visibility),
              ),
              SizedBox(height: AppSizes.size30),
              Text(AppConstants.forgotPassword),
              SizedBox(height: AppSizes.size10),
              CustomGradientButton(
                  onPressed: () {},
                  text: AppConstants.login,
                  textStyle: TextStyle(
                      color: AppColors.whiteFeather,
                      fontWeight: FontWeight.bold),
                  gradientColors: [
                    AppTheme.primaryColor,
                    AppTheme.primaryColor
                  ],
                  borderRadius: AppSizes.size8),
              SizedBox(height: AppSizes.size8),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: AppConstants.donTHaveAccount,
                      style: TextStyle(color: Colors.grey.shade600),
                      children: [
                        TextSpan(
                            text: AppConstants.signUp,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()) ///used to add onTop functionality
                      ]),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
