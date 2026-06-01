import 'package:flutter/material.dart';

import 'core/theme/app_colors.dart';
import 'features/main/view/main_screen.dart';

void main() {
  runApp(const EvencirApp());
}

class EvencirApp extends StatelessWidget {
  const EvencirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evencir',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Mulish',
        scaffoldBackgroundColor: AppColors.background,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
