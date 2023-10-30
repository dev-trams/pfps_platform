import 'package:flutter/material.dart';
import 'package:pfps_platform/Screen/mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PFPS_PLATFORM',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}