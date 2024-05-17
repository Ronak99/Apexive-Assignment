import 'package:apexive_assignment/core/theme/data/app_theme.dart';
import 'package:apexive_assignment/ui/pages/view_all_timers_screen.dart';
import 'package:apexive_assignment/ui/widgets/appbar/custom_appbar.dart';
import 'package:apexive_assignment/ui/widgets/content/no_content_view.dart';
import 'package:flutter/material.dart';
import 'package:apexive_assignment/shared/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const ViewAllTimersScreen(),
    );
  }
}
