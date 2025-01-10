// import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_app/changepassword_screen.dart';
import 'package:test_app/forget.dart';
// import 'package:test_app/code_screen.dart';
// import 'package:test_app/code_screen.dart';
// import 'package:test_app/codepage_screen.dart';
import 'package:test_app/forget_screen.dart';
import 'package:test_app/reset_screen.dart';
import 'package:test_app/update_screen.dart';
import 'login_screen.dart'; // Import your LoginScreen
import 'register_screen.dart';
import 'display_screen.dart'; // Import your RegisterScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login & Register App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: ToggleScreen(),
      initialRoute: '/login',
      routes: {
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/display': (context) => DisplayScreen(),
        '/forget': (context) => ForgetScreen(),
        '/changepassword': (context) => ChangePasswordScreen(),
        '/reset': (context) => ResetScreen(),
        '/update': (context) => UpdateScreen(),
        '/forgot': (context) => ForgotScreen()
        // '/codepage': (context) => CodePageSceeen(),
        // '/toggle': (context) => ToggleScreen(),
      },
    );
  }
}
