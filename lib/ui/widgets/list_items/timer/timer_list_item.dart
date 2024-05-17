import 'package:apexive_assignment/shared/constants/assets.dart';
import 'package:apexive_assignment/ui/pages/task_details_screen.dart';
import 'package:apexive_assignment/ui/pages/view_all_timers_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TimerListItem extends StatelessWidget {
  const TimerListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey key = GlobalKey();

    return GestureDetector(
      onTap: () => Navigator.push(context, TaskDetailsScreen.route()),
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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailsView(
                      icon: Assets.starSmallIcon,
                      text: 'iOS app deployment',
                      isTitle: true,
                      iconSize: 16,
                    ),
                    SizedBox(height: 4),
                    DetailsView(
                      icon: Assets.briefcaseSmallIcon,
                      text: 'S0056 - Booquio V2',
                      isTitle: false,
                    ),
                    SizedBox(height: 4),
                    DetailsView(
                      icon: Assets.clockSmallIcon,
                      text: 'Deadline 07/20/2023',
                      isTitle: false,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 48,
              width: 104,
              padding:
                  const EdgeInsets.only(left: 16, right: 8, bottom: 8, top: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                // color: Colors.white,
                borderRadius: BorderRadius.circular(64),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '00:30',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(width: 0),
                  Container(
                    height: 32,
                    width: 32,
                    padding: const EdgeInsets.all(4),
                    child: SvgPicture.asset(Assets.pauseIcon),
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
