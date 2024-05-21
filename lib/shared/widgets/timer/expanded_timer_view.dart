import 'package:apexive_assignment/shared/constants/assets.dart';
import 'package:apexive_assignment/shared/constants/styles.dart';
import 'package:apexive_assignment/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExpandedTimerView extends StatelessWidget {
  final bool isRunning;
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onStop;
  final Duration duration;
  const ExpandedTimerView({
    super.key,
    required this.isRunning,
    required this.onPlay,
    required this.onPause,
    required this.onStop,
    required this.duration,
  });

  Widget timerButton({
    required VoidCallback onTap,
    required String icon,
    required BuildContext context,
    bool isResetButton = false,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isResetButton
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          height: 48,
          width: 48,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              isResetButton
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onPrimaryContainer,
              BlendMode.srcIn,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Utils.formatDuration(duration),
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            timerButton(
              icon: Assets.stopIcon,
              onTap: onStop,
              isResetButton: true,
              context: context,
            ),
            const SizedBox(width: 16),
            timerButton(
              icon: isRunning ? Assets.pauseIcon : Assets.playIcon,
              onTap: isRunning ? onPause : onPlay,
              isResetButton: false,
              context: context,
            ),
          ],
        ),
      ],
    );
  }
}
