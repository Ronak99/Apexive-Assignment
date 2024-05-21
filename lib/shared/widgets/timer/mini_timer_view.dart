import 'package:apexive_assignment/shared/constants/assets.dart';
import 'package:apexive_assignment/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MiniTimerView extends StatelessWidget {
  final bool isRunning;
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final Duration duration;
  const MiniTimerView({
    super.key,
    required this.isRunning,
    required this.onPlay,
    required this.onPause,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    Color foregroundColor = isRunning
        ? Theme.of(context).colorScheme.onPrimaryContainer
        : Theme.of(context).colorScheme.primary;
    Color backgroundColor = isRunning
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.primary.withOpacity(.08);

    return GestureDetector(
      onTap: isRunning ? onPause : onPlay,
      child: AnimatedContainer(
        height: 48,
        width: 104,
        padding: const EdgeInsets.only(left: 16, right: 8, bottom: 8, top: 8),
        duration: const Duration(milliseconds: 350),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(64),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Utils.formatDuration(duration),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: foregroundColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(width: 0),
            Container(
              height: 32,
              width: 32,
              padding: const EdgeInsets.all(4),
              child: SvgPicture.asset(
                isRunning ? Assets.pauseIcon : Assets.playIcon,
                colorFilter: ColorFilter.mode(
                  foregroundColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
