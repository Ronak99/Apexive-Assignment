import 'package:apexive_assignment/features/timers/presentation/pages/details/tabs/details_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:apexive_assignment/core/models/app_timer.dart';
import 'package:apexive_assignment/features/ticker/bloc/ticker_bloc.dart';
import 'package:apexive_assignment/shared/constants/assets.dart';
import 'package:apexive_assignment/shared/utils/utils.dart';
import 'package:apexive_assignment/shared/widgets/appbar/custom_appbar.dart';
import 'package:apexive_assignment/shared/widgets/appbar/custom_tabbar.dart';
import 'package:apexive_assignment/shared/widgets/scaffold/app_scaffold.dart';
import 'package:apexive_assignment/features/timers/presentation/pages/details/tabs/timesheets_tab.dart';

class TaskDetailsScreen extends StatefulWidget {
  final AppTimer appTimer;
  final TickerBloc tickerBloc;
  const TaskDetailsScreen({
    super.key,
    required this.appTimer,
    required this.tickerBloc,
  });

  static route({required AppTimer appTimer, required TickerBloc tickerBloc}) =>
      MaterialPageRoute(
        builder: (context) => TaskDetailsScreen(
          appTimer: appTimer,
          tickerBloc: tickerBloc,
        ),
      );

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> tabs = [
    'Timesheets',
    'Details',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: CustomAppBar(
        title: Text(
          widget.appTimer.task.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          GestureDetector(
            child: Container(
              height: 48,
              width: 48,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                Assets.pencil,
              ),
            ),
          )
        ],
      ),
      tabbar: CustomTabBar(
        tabController: _tabController,
        tabs: tabs,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BlocProvider<TickerBloc>.value(
            value: widget.tickerBloc,
            child: TimesheetsTab(appTimer: widget.appTimer),
          ),
          DetailsTab(appTimer: widget.appTimer),
        ],
      ),
    );
  }
}
