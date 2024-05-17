import 'package:flutter/material.dart';

import 'package:apexive_assignment/shared/constants/assets.dart';
import 'package:apexive_assignment/ui/pages/create_timer_screen.dart';
import 'package:apexive_assignment/ui/widgets/buttons/app_bar_action_button.dart';

import 'custom_tabbar.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final List<Widget>? actions;
  const CustomAppBar({
    super.key,
    this.leading,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (leading != null) leading!,
          title,
          if (actions != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: actions!,
            ),
        ],
      ),
    );
  }
}
