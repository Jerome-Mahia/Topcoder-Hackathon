import 'package:flutter/material.dart';
import 'package:topcoder_hackathon/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Topcoder Hackathon',
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
