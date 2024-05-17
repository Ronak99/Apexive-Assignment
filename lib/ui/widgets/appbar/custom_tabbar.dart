import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget implements PreferredSizeWidget {
  final List<String> tabs;
  const CustomTabBar({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TabBar(
        controller: _tabController,
        tabs: widget.tabs.map((e) => Text(e)).toList(),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white,
        labelStyle: Theme.of(context).textTheme.labelMedium,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.white,
        dividerColor: Colors.white.withOpacity(.16),
      ),
    );
  }
}
