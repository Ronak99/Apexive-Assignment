import 'package:apexive_assignment/features/timesheets/bloc/app_timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:apexive_assignment/core/models/app_timer.dart';
import 'package:apexive_assignment/features/ticker/bloc/ticker_bloc.dart';
import 'package:apexive_assignment/shared/constants/assets.dart';
import 'package:apexive_assignment/shared/constants/colors.dart';
import 'package:apexive_assignment/shared/utils/utils.dart';
import 'package:apexive_assignment/shared/widgets/appbar/custom_appbar.dart';
import 'package:apexive_assignment/shared/widgets/appbar/custom_tabbar.dart';
import 'package:apexive_assignment/shared/widgets/scaffold/app_scaffold.dart';
import 'package:apexive_assignment/shared/widgets/timer/custom_timer_view.dart';

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
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
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
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              width: double.infinity,
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: white.withOpacity(.08),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BasicDetailsView(),
                        const SizedBox(height: 8),
                        CustomTimerView(
                          duration: widget.appTimer.task.duration,
                          showExpandedView: true,
                          onStop: () {
                            context.read<AppTimerBloc>().add(
                                  MarkCompleteRequested(
                                    appTimer: widget.appTimer,
                                  ),
                                );

                            Utils.showSnackbar(
                                message:
                                    'The task and the project were marked as completed.',
                                level: SnackbarLevel.success);

                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(height: 16),
                        const Divider(height: 0),
                        const SizedBox(height: 16),
                        DescriptionView(text: widget.appTimer.description),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(),
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

// class TimerView extends StatelessWidget {
//   const TimerView({super.key});

//   Widget timerButton({
//     required VoidCallback onTap,
//     required String icon,
//     double opacity = 1,
//   }) =>
//       Container(
//         decoration: BoxDecoration(
//           color: white.withOpacity(opacity),
//           shape: BoxShape.circle,
//         ),
//         height: 48,
//         width: 48,
//         alignment: Alignment.center,
//         child: SvgPicture.asset(icon),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TickerBloc, TickerState>(
//       builder: (context, state) {
//         // final duration =
//         //     context.select((TickerBloc bloc) => bloc.state.duration);

//         final tickerBloc = BlocProvider.of<TickerBloc>(context);

//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               tickerBloc.state.duration.toString(),
//               style: Theme.of(context).textTheme.displayLarge,
//             ),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 timerButton(
//                   icon: Assets.stopIcon,
//                   onTap: () {},
//                   opacity: .16,
//                 ),
//                 const SizedBox(width: 16),
//                 timerButton(
//                   icon: Assets.pauseIcon,
//                   onTap: () {},
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
