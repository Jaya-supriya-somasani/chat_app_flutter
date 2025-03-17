import 'package:chat_app/core/constants/app_sizes.dart';
import 'package:chat_app/core/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';

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
        body: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSizes.size30),
            Text("Welcome Back",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              "Sign in to continue",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.grey),
            ),
            SizedBox(height: 20),
            CustomTextFields(
              textEditingController: email,
              hintText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
            CustomTextFields(
              textEditingController: password,
              hintText: "Password",
              obscureText: true,
              suffixIcon: Icon(Icons.visibility),
            )
          ],
        )),
      ),
    );
  }
}
