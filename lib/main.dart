import 'package:chat_app/config/theme/app_theme.dart';
import 'package:chat_app/presentation/screens/auth/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  // Ensure Flutter engine is initialized before using any plugins
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      ///Adding custom theme
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}
