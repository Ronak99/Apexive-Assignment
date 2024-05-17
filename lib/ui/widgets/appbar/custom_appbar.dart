import 'package:flutter/material.dart';

import 'package:apexive_assignment/shared/constants/assets.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  final bool showBackButton;
  final Widget title;
  final List<Widget>? actions;
  const CustomAppBar({
    super.key,
    this.showBackButton = true,
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
          if (showBackButton)
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 48,
                width: 48,
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  Assets.back,
                ),
              ),
            ),
          title,
          if (actions != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: actions!,
            )
          else if (showBackButton)
            Container(
              width: 48,
              height: 48,
              color: Colors.transparent,
            )
        ],
      ),
    );
  }
}
