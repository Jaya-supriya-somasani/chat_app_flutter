import 'package:chat_app/config/theme/app_theme.dart';
import 'package:chat_app/core/constants/app_sizes.dart';
import 'package:chat_app/core/widgets/custom_gradient_button.dart';
import 'package:chat_app/core/widgets/custom_text_fields.dart';
import 'package:chat_app/presentation/screens/auth/signup/sign_up_screen.dart';
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
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    _emailFocusNode.dispose();
    passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter email address";
    }
    final emailRegex = RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address (e.g., example@email.com)';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /// Here form is used for validating the user credentials
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.size8),
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
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
                          textEditingController: emailController,
                          hintText: AppConstants.email,
                          prefixIcon: Icon(Icons.email),
                          validator: _validateEmail,
                          focusNode: _emailFocusNode),
                      SizedBox(height: AppSizes.size20),
                      CustomTextFields(
                        textEditingController: passwordController,
                        hintText: AppConstants.password,
                        prefixIcon: Icon(Icons.lock_outline),
                        obscureText: !_isPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        validator: _validatePassword,
                        focusNode: _passwordFocusNode,
                      ),
                      SizedBox(height: AppSizes.size30),
                      Text(AppConstants.forgotPassword),
                      SizedBox(height: AppSizes.size10),
                      CustomGradientButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState?.validate() ?? false) {}
                          },
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
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpScreen()));
                                      })

                                ///used to add onTop functionality
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
