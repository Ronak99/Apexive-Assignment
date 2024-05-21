import 'package:apexive_assignment/features/timesheets/bloc/app_timer_bloc.dart';
import 'package:apexive_assignment/shared/constants/assets.dart';
import 'package:apexive_assignment/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:apexive_assignment/core/models/app_timer.dart';
import 'package:apexive_assignment/features/ticker/bloc/ticker_bloc.dart';
import 'package:apexive_assignment/features/timesheets/presentation/pages/details/task_details_screen.dart';
import 'package:apexive_assignment/shared/constants/colors.dart';
import 'package:apexive_assignment/shared/widgets/timer/custom_timer_view.dart';
import 'package:flutter_svg/svg.dart';

class TimesheetsTab extends StatelessWidget {
  final AppTimer appTimer;
  const TimesheetsTab({
    super.key,
    required this.appTimer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      child: ListView(
        children: [
          if (appTimer.isComplete)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Completed Records',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          if (appTimer.isComplete)
            Container(
              decoration: BoxDecoration(
                color: white.withOpacity(.08),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(Assets.circularCheckmark),
                      const SizedBox(width: 8),
                      const BasicDetailsView(),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(64),
                      color: white.withOpacity(.16),
                    ),
                    height: 32,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.center,
                    child: Text(
                      Utils.formatDuration(appTimer.task.duration),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            )
          else
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
                    duration: appTimer.task.duration,
                    showExpandedView: true,
                    onStop: () {
                      context.read<AppTimerBloc>().add(
                            MarkCompleteRequested(appTimer: appTimer),
                          );

                      Utils.showSnackbar(
                        message:
                            'The task and the project were marked as completed.',
                        level: SnackbarLevel.success,
                      );

                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 16),
                  const Divider(height: 0),
                  const SizedBox(height: 16),
                  DescriptionView(text: appTimer.description),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
