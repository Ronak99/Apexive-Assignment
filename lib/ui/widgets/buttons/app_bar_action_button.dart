import 'package:apexive_assignment/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  const AppBarActionButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 48,
        margin: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          color: white.withOpacity(.16),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          icon,
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
