class Assets {
  static const _images = 'assets/images';
  static const add = '$_images/add.svg';
  static const arrowUpDown = '$_images/arrow_up_down.svg';
  static const odoo = '$_images/odoo.svg';
  static const clock = '$_images/clock.svg';
  static const favourite = '$_images/favourite.svg';
  static const projectsIcon = '$_images/projects_icon.svg';
  static const settingsIcon = '$_images/settings_icon.svg';
  static const timesheetsIcon = '$_images/timesheets_icon.svg';
  static const clockSmallIcon = '$_images/clock_small.svg';
  static const briefcaseSmallIcon = '$_images/briefcase_small.svg';
  static const starSmallIcon = '$_images/star_small.svg';
  static const pauseIcon = '$_images/pause.svg';
  static const back = '$_images/back.svg';
  static const down = '$_images/down.svg';
}

class NoContentData {
  final String icon;
  final String title;
  final String subtitle;

  NoContentData._({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  factory NoContentData.odooTimesheets() {
    return NoContentData._(
      icon: Assets.odoo,
      title: "You don't have any odoo timesheets",
      subtitle: "Synchronize with odoo to get started",
    );
  }
  factory NoContentData.localTimesheets() {
    return NoContentData._(
      icon: Assets.clock,
      title: "You don't have any local timesheets",
      subtitle: "Create a timer to begin tracking time",
    );
  }
  factory NoContentData.favourites() {
    return NoContentData._(
      icon: Assets.favourite,
      title: "No favorited timers yet",
      subtitle:
          "You can mark a timer as favorite either on the timer creation page or within an existing timer",
    );
  }
  factory NoContentData.localProjects() {
    return NoContentData._(
      icon: Assets.favourite,
      title: "You don't have any local projects",
      subtitle: "Create a project to begin",
    );
  }
  factory NoContentData.odooProjects() {
    return NoContentData._(
      icon: Assets.odoo,
      title: "You don't have any projects from odoo",
      subtitle: "Synchronize with odoo to get started",
    );
  }
}
