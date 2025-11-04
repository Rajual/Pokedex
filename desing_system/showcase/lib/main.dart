import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';
import 'routes.dart';

void main() {
  runApp(const ShowcaseApp());
}

class ShowcaseApp extends StatelessWidget {
  const ShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design System Showcase',
      theme: AppTheme.lightTheme.copyWith(
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      initialRoute: ShowcaseRoutes.home,
      routes: ShowcaseRoutes.getRoutes(),
    );
  }
}