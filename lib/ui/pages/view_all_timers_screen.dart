import 'package:apexive_assignment/shared/constants/assets.dart';
import 'package:apexive_assignment/ui/pages/create_timer_screen.dart';
import 'package:apexive_assignment/ui/widgets/appbar/custom_bottom_navigation_bar.dart';
import 'package:apexive_assignment/ui/widgets/appbar/custom_appbar.dart';
import 'package:apexive_assignment/ui/widgets/appbar/custom_tabbar.dart';
import 'package:apexive_assignment/ui/widgets/buttons/app_bar_action_button.dart';
import 'package:apexive_assignment/ui/widgets/list_items/timer/timer_list_item.dart';
import 'package:apexive_assignment/ui/widgets/scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ViewAllTimersScreen extends StatelessWidget {
  const ViewAllTimersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      appbar: CustomAppBar(
        title: Text(
          'Timesheets',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          AppBarActionButton(
            onTap: () => {},
            icon: Assets.arrowUpDown,
          ),
          AppBarActionButton(
            onTap: () => Navigator.push(
              context,
              CreateTimerScreen.route(),
            ),
            icon: Assets.add,
          ),
        ],
      ),
      tabbar: const CustomTabBar(),
      footer: const CustomBottomNavigationBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            'You have 16 Timers',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              padding: const EdgeInsets.only(top: 16),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) => const TimerListItem(),
            ),
          ),
        ],
      ),
    );
  }
}
