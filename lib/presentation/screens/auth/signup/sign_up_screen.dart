import 'package:chat_app/core/widgets/custom_gradient_button.dart';
import 'package:chat_app/core/widgets/custom_text_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../config/theme/app_theme.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_sizes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  bool _isPasswordVisible = false;
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _userNameFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    userNameController.dispose();
    phoneNumberController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _userNameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter Full Name";
    }
    return null;
  }

  String? _validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter User Name";
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter email address";
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
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

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }

    final phoneRegex = RegExp(r'^\+?[\d\s-]{10,}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number (e.g., +1234567890)';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Create account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("Please fill the details to continue",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.grey)),
                  SizedBox(height: 10),
                  CustomTextFields(
                    textEditingController: nameController,
                    hintText: "Full Name",
                    prefixIcon: Icon(Icons.person_outlined),
                    validator: _validateFullName,
                    focusNode: _nameFocusNode,
                  ),
                  SizedBox(height: 20),
                  CustomTextFields(
                    textEditingController: userNameController,
                    hintText: "User Name",
                    prefixIcon: Icon(Icons.alternate_email),
                    validator: _validateUserName,
                    focusNode: _userNameFocusNode,
                  ),
                  SizedBox(height: 20),
                  CustomTextFields(
                    textEditingController: emailController,
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    validator: _validateEmail,
                    focusNode: _emailFocusNode,
                  ),
                  SizedBox(height: 20),
                  CustomTextFields(
                    textEditingController: phoneNumberController,
                    hintText: "Phone Number",
                    prefixIcon: Icon(Icons.phone_outlined),
                    validator: _validatePhone,
                    focusNode: _phoneNumberFocusNode,
                  ),
                  SizedBox(height: 20),
                  CustomTextFields(
                      textEditingController: passwordController,
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          }),
                      validator: _validatePassword,
                      focusNode: _passwordFocusNode),
                  SizedBox(height: 20),
                  CustomGradientButton(
                      text: "Sign in",
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState?.validate() ?? false) {}
                      },
                      textStyle: TextStyle(
                          color: AppColors.whiteFeather,
                          fontWeight: FontWeight.bold),
                      gradientColors: [
                        AppTheme.primaryColor,
                        AppTheme.primaryColor
                      ],
                      borderRadius: AppSizes.size8),
                  SizedBox(height: 20),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.grey.shade600),
                          children: [
                            TextSpan(
                                text: AppConstants.login,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pop(context);
                                  })

                            ///used to add onTop functionality
                          ]),
                    ),
                  )
                ],
              ),
            ),
          )),
    ));
  }
}
