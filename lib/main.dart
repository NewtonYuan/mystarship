import 'package:flutter/material.dart';
import 'package:mystarship/tools/constants.dart';
import 'package:mystarship/pages/home.dart';

// Main Function
void main() {
  runApp(const MyApp());
}

// Main App
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Main App Root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Starship',
      theme: ThemeData(
          scaffoldBackgroundColor: primaryColor,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: lightColor)),
      // Home Page
      home: const Home(),
    );
  }
}

// Home Widget
