import 'package:apexive_assignment/features/timesheets/bloc/app_timer_bloc.dart';
import 'package:apexive_assignment/shared/constants/assets.dart';
import 'package:apexive_assignment/shared/constants/numerics.dart';
import 'package:apexive_assignment/features/create_timer/create_timer_screen.dart';
import 'package:apexive_assignment/ui/widgets/appbar/custom_bottom_navigation_bar.dart';
import 'package:apexive_assignment/ui/widgets/appbar/custom_appbar.dart';
import 'package:apexive_assignment/ui/widgets/appbar/custom_tabbar.dart';
import 'package:apexive_assignment/ui/widgets/buttons/app_bar_action_button.dart';
import 'package:apexive_assignment/ui/widgets/content/no_content_view.dart';
import 'package:apexive_assignment/ui/widgets/list_items/timer/timer_list_item.dart';
import 'package:apexive_assignment/ui/widgets/scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ViewAllTimersScreen extends StatelessWidget {
  const ViewAllTimersScreen({super.key});

  static route() =>
      MaterialPageRoute(builder: (context) => const ViewAllTimersScreen());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: CustomAppBar(
        showBackButton: false,
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
      tabbar: const CustomTabBar(
        tabs: ['Favourites', 'Odoo', 'Local'],
      ),
      footer: const CustomBottomNavigationBar(),
      body: BlocBuilder<AppTimerBloc, AppTimerState>(
        builder: (context, state) {
          if (state is AppTimerInitial) {
            return NoContentView(
                noContentData: NoContentData.localTimesheets());
          } else if (state is AppTimerLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  'You have ${state.appTimers.length} Timers',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.separated(
                    itemCount: state.appTimers.length,
                    padding: const EdgeInsets.only(top: 16),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (context, index) => TimerListItem(
                      appTimer: state.appTimers[index],
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
