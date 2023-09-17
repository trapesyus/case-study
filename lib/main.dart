import 'package:case_study/core/helper/initialize/initialize.dart';
import 'package:case_study/core/helper/preferences/preferences.dart';
import 'package:case_study/screen/home_screen/home_screen.dart';

import 'package:flutter/material.dart';
import 'screen/login_screen/login_screen.dart';

void main() async {
  await Initialize.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Preferences.userUid == '' ? LoginScreen() : HomeScreen(),
    );
  }
}
