import 'package:apexive_assignment/features/timesheets/presentation/pages/details/tabs/details_tab.dart';
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
import 'package:apexive_assignment/features/timesheets/presentation/pages/details/tabs/timesheets_tab.dart';

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

class DescriptionView extends StatefulWidget {
  final String text;
  const DescriptionView({
    super.key,
    required this.text,
  });

  @override
  State<DescriptionView> createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {
  bool isOverflowed = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.labelMedium!.copyWith(
          fontWeight: FontWeight.w400,
        );

    if (Utils.doesExceedsMaxLines(
      context: context,
      text: widget.text,
      maxLines: 2,
      textStyle: textStyle,
    )) {
      isOverflowed = true;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 32,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Description',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Container(
                height: 32,
                width: 32,
                alignment: Alignment.center,
                child: SvgPicture.asset(Assets.pencil),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () {
            if (!isOverflowed) return;
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.text,
                maxLines: isExpanded ? null : 2,
                overflow: isExpanded ? null : TextOverflow.ellipsis,
                style: textStyle,
              ),
              if (!isExpanded && isOverflowed)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: Text(
                    'Read More',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class BasicDetailsView extends StatelessWidget {
  const BasicDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Monday',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 4),
        Text(
          '17.07.2023',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          'Start Time 10:00',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
