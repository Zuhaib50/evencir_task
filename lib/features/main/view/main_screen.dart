import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_bottom_nav_bar.dart';
import '../../home/view/home_screen.dart';
import '../../mood/view/mood_screen.dart';
import '../../plan/view/plan_screen.dart';
import '../../profile/view/profile_screen.dart';
import '../view_model/main_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const List<BottomNavItemData> _navItems = [
    BottomNavItemData(
      iconPath: 'assets/icons/home_tab.png',
      label: 'Nutrition',
    ),
    BottomNavItemData(iconPath: 'assets/icons/plan_tab.png', label: 'Plan'),
    BottomNavItemData(iconPath: 'assets/icons/mood_tab.png', label: 'Mood'),
    BottomNavItemData(
      iconPath: 'assets/icons/profile_tab.png',
      label: 'Profile',
    ),
  ];

  static const List<Widget> _tabs = [
    HomeScreen(),
    PlanScreen(),
    MoodScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainCubit(),
      child: BlocBuilder<MainCubit, int>(
        builder: (context, index) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: IndexedStack(index: index, children: _tabs),
            bottomNavigationBar: AppBottomNavBar(
              items: _navItems,
              currentIndex: index,
              onTap: context.read<MainCubit>().select,
            ),
          );
        },
      ),
    );
  }
}
