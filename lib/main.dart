import 'package:flutter/material.dart';
import 'package:topcoder_hackathon/screens/login.dart';

// Main entry point for the application.
// Configures and runs the Flutter app with MaterialApp,
// setting the theme and initial screen to LoginScreen.

void main() {
  runApp(const MyApp());
}

String fullName= '';
String userName= '';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Romex Topcoder Hackathon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.black,
          secondary: Colors.white,
          background: Colors.white,
          tertiary: Colors.black38,
          surfaceTint: Colors.white,
          error: Colors.red,
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
