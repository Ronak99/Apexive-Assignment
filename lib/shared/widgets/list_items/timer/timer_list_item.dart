import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:apexive_assignment/core/models/app_timer.dart';
import 'package:apexive_assignment/features/ticker/bloc/ticker_bloc.dart';
import 'package:apexive_assignment/features/ticker/ticker.dart';
import 'package:apexive_assignment/shared/constants/assets.dart';
import 'package:apexive_assignment/shared/constants/colors.dart';
import 'package:apexive_assignment/features/timesheets/presentation/pages/details/task_details_screen.dart';
import 'package:apexive_assignment/shared/widgets/timer/custom_timer_view.dart';

class TimerListItem extends StatefulWidget {
  final AppTimer appTimer;
  const TimerListItem({
    super.key,
    required this.appTimer,
  });

  @override
  State<TimerListItem> createState() => _TimerListItemState();
}

class _TimerListItemState extends State<TimerListItem> {
  late TickerBloc tickerBloc;

  @override
  void initState() {
    super.initState();

    tickerBloc = TickerBloc(
      ticker: Ticker(duration: widget.appTimer.task.duration),
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey key = GlobalKey();

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TaskDetailsScreen(
              appTimer: widget.appTimer, tickerBloc: tickerBloc),
        ),
      ),
      child: BlocProvider(
        create: (_) => tickerBloc,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.08),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  key: key,
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Color(0xffFFC629),
                        width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailsView(
                        icon: Assets.starSmallIcon,
                        text: widget.appTimer.project.name,
                        isTitle: true,
                        iconSize: 16,
                      ),
                      const SizedBox(height: 4),
                      DetailsView(
                        icon: Assets.briefcaseSmallIcon,
                        text: widget.appTimer.task.name,
                        isTitle: false,
                      ),
                      const SizedBox(height: 4),
                      const DetailsView(
                        icon: Assets.clockSmallIcon,
                        text: 'Deadline 07/20/2023',
                        isTitle: false,
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.appTimer.isComplete)
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 48,
                  alignment: Alignment.center,
                  child: Text(
                    'Completed',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black),
                  ),
                )
              else
                CustomTimerView(
                  duration: widget.appTimer.task.duration,
                  showExpandedView: false,
                  onStop: () {},
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsView extends StatelessWidget {
  final String text;
  final String icon;
  final double iconSize;
  final bool isTitle;
  const DetailsView({
    super.key,
    required this.text,
    required this.icon,
    this.iconSize = 24,
    required this.isTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 24,
          width: 24,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            icon,
            height: iconSize,
            width: iconSize,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: isTitle
              ? Theme.of(context).textTheme.bodyLarge
              : Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
