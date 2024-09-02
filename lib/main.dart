import 'package:flutter/material.dart';
import 'package:psventuresassignment/features/navigation/navigation_page.dart';
import 'package:psventuresassignment/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AudioCity',
      theme: AppTheme.theme,
      home: const NavigationPage(),
    );
  }
}