import 'package:flutter/material.dart';

class DateAndTimeView extends StatelessWidget {
  const DateAndTimeView({super.key});

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
