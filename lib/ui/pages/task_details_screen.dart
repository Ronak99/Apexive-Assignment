import 'package:apexive_assignment/shared/constants/assets.dart';
import 'package:apexive_assignment/shared/constants/colors.dart';
import 'package:apexive_assignment/ui/widgets/appbar/custom_appbar.dart';
import 'package:apexive_assignment/ui/widgets/appbar/custom_tabbar.dart';
import 'package:apexive_assignment/ui/widgets/scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  static route() =>
      MaterialPageRoute(builder: (context) => const TaskDetailsScreen());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      appbar: CustomAppBar(
        title: Text(
          'Get to know Apexer - Ivan',
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
                  DescriptionView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionView extends StatelessWidget {
  const DescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
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
        Text(
          'Sync with Client, communicate, work on the new design with designer, new tasks preparation call with the front end',
          maxLines: 2,
          overflow: TextOverflow.clip,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          'Read More',
          style: Theme.of(context).textTheme.bodySmall,
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
            Container(
              decoration: BoxDecoration(
                color: white.withOpacity(.16),
                shape: BoxShape.circle,
              ),
              height: 48,
              width: 48,
            ),
            const SizedBox(width: 16),
            Container(
              decoration: const BoxDecoration(
                color: white,
                shape: BoxShape.circle,
              ),
              height: 48,
              width: 48,
            ),
          ],
        ),
      ],
    );
  }
}
