import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:apexive_assignment/shared/constants/assets.dart';

class NoContentView extends StatelessWidget {
  final NoContentData noContentData;
  const NoContentView({
    super.key,
    required this.noContentData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            noContentData.icon,
            height: 192,
            width: 192,
          ),
          const SizedBox(height: 22),
          Text(
            noContentData.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            noContentData.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
