import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.websiteName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Constants.mainColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
