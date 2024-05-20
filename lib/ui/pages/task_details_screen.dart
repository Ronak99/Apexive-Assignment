import 'package:apexive_assignment/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:apexive_assignment/core/models/app_timer.dart';
import 'package:apexive_assignment/shared/constants/assets.dart';
import 'package:apexive_assignment/shared/constants/colors.dart';
import 'package:apexive_assignment/ui/widgets/appbar/custom_appbar.dart';
import 'package:apexive_assignment/ui/widgets/appbar/custom_tabbar.dart';
import 'package:apexive_assignment/ui/widgets/scaffold/app_scaffold.dart';

class TaskDetailsScreen extends StatelessWidget {
  final AppTimer appTimer;
  const TaskDetailsScreen({
    super.key,
    required this.appTimer,
  });

  static route({required AppTimer appTimer}) => MaterialPageRoute(
      builder: (context) => TaskDetailsScreen(appTimer: appTimer));

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: CustomAppBar(
        title: Text(
          appTimer.task.name,
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
      tabbar: const CustomTabBar(
        tabs: [
          'Timesheets',
          'Details',
        ],
      ),
      body: Container(
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BasicDetailsView(),
                  SizedBox(height: 8),
                  TimerView(),
                  SizedBox(height: 16),
                  Divider(height: 0),
                  SizedBox(height: 16),
                  DescriptionView(
                    text:
                        "My description that keeps on going and going and going and going and going and going and going",
                  ),
                ],
              ),
            ),
          ],
        ),
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

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  Widget timerButton({
    required VoidCallback onTap,
    required String icon,
    double opacity = 1,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: white.withOpacity(opacity),
          shape: BoxShape.circle,
        ),
        height: 48,
        width: 48,
        alignment: Alignment.center,
        child: SvgPicture.asset(icon),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '08:08:20',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            timerButton(
              icon: Assets.stopIcon,
              onTap: () {},
              opacity: .16,
            ),
            const SizedBox(width: 16),
            timerButton(
              icon: Assets.pauseIcon,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
