import 'package:apexive_assignment/shared/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationBarItem {
  String icon;
  String label;
  BottomNavigationBarItem._({
    required this.icon,
    required this.label,
  });

  factory BottomNavigationBarItem.projects() {
    return BottomNavigationBarItem._(
        icon: Assets.projectsIcon, label: "Projects");
  }
  factory BottomNavigationBarItem.settings() {
    return BottomNavigationBarItem._(
        icon: Assets.settingsIcon, label: "Settings");
  }
  factory BottomNavigationBarItem.timesheets() {
    return BottomNavigationBarItem._(
        icon: Assets.timesheetsIcon, label: "Timesheets");
  }

  static List<BottomNavigationBarItem> values = [
    BottomNavigationBarItem.timesheets(),
    BottomNavigationBarItem.projects(),
    BottomNavigationBarItem.settings(),
  ];
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: BottomNavigationBarItem.values
            .map(
              (e) => Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      e.icon,
                      height: 21,
                      width: 24,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      e.label,
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
