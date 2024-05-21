import 'package:apexive_assignment/shared/constants/numerics.dart';
import 'package:apexive_assignment/shared/widgets/appbar/custom_tabbar.dart';
import 'package:flutter/material.dart';

import 'package:apexive_assignment/shared/constants/colors.dart';

class AppScaffold extends StatelessWidget {
  final Widget appbar;
  final Widget? tabbar;
  final Widget? footer;
  final Widget body;
  final EdgeInsets padding;

  const AppScaffold({
    super.key,
    required this.appbar,
    this.tabbar,
    this.footer,
    this.padding = pagePadding,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).highlightColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: padding,
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              appbar,
              tabbar ?? const SizedBox.shrink(),
              Expanded(
                child: body,
              ),
              footer ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
